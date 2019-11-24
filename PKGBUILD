# Maintainer: sonntex <sonntex@gmail.com>

pkgname=libsmall-git
pkgver=0.r122.57e48de
pkgrel=1
pkgdesc="tarantool specialized memory allocators"
arch=('x86_64')
url="https://github.com/sonntex/small"
license=('GPL')
depends=()
makedepends=('cmake')
provides=('libsmall')
conflicts=('libsmall')
source=('git+https://github.com/sonntex/small.git')
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/small
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/small
    cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd ${srcdir}/small
    make DESTDIR="${pkgdir}" install
}
