# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libfido2
pkgver=1.3.0
pkgrel=1
pkgdesc="Provides library functionality for FIDO 2.0, including communication with a device over USB"
arch=('x86_64')
url="https://developers.yubico.com/libfido2/"
license=('BSD')
depends=('openssl' 'libcbor' 'hidapi')
makedepends=('git' 'cmake')
source=("git+https://github.com/Yubico/libfido2.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/$pkgname/build"
    cmake .. \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
