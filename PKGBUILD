# Maintainer: phi <phi at qgr dot se>
# Contributor: smlb <smlb at riseup dot net>

pkgname=dockd
pkgver=1.21
pkgrel=1
pkgdesc="Lenovo ThinkPad Dock Management Daemon"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/dockd"
license=('BSD')
depends=('libthinkpad' 'libxrandr')
makedepends=('cmake')
source=("https://libthinkpad.github.io/ftp/dockd/$pkgname-$pkgver.tar.gz")
md5sums=('67093aa2889fd140a6460ab7897087ac')

prepare () {
    mkdir -p "$srcdir/$pkgname-$pkgver/etc"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1 
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1 
    install -Dm755 -d etc "$pkgdir/etc/$pkgname"
    make DESTDIR=$pkgdir install
}
