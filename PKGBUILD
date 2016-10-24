# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libump-git
pkgver=r15.ec06806
pkgrel=1
pkgdesc='Unified Memory Provider userspace API'
arch=('armv7h')
url='https://github.com/linux-sunxi/libump'
license=('APACHE')
depends=('glibc')
makedepends=('git')
provides=('libump')
conflicts=('libump')
source=("git+https://github.com/linux-sunxi/libump.git")
md5sums=('SKIP')

pkgver() {
    cd libump
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd libump
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd libump
    make DESTDIR="${pkgdir}" install
}
