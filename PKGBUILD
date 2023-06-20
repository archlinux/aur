# Maintainer: 1ridic <i at 8f dot al>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Stephan Eisvogel <eisvogel ät seitics dot de>

pkgname=pg_top
pkgver=r360.32d9c58
pkgrel=1
pkgdesc='Top for PostgreSQL'
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
license=('BSD')  # original BSD license
url="https://pg_top.gitlab.io/"
makedepends=('git' 'cmake' 'ncurses')
depends=('postgresql-libs' 'libbsd')
source=("$pkgname::git+https://gitlab.com/pg_top/pg_top.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}
    LDFLAGS="-lncurses $LDFLAGS"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd ${srcdir}/${pkgname}/build
    make DESTDIR="${pkgdir}" install
}

