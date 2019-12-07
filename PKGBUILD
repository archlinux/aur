# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libfido2
pkgver=1.3.0
pkgrel=3
pkgdesc="Provides library functionality for FIDO 2.0, including communication with a device over USB"
arch=('x86_64')
url="https://developers.yubico.com/libfido2/"
license=('BSD')
depends=('openssl' 'libcbor' 'hidapi')
makedepends=('git' 'cmake')
source=("https://developers.yubico.com/libfido2/Releases/libfido2-${pkgver}.tar.gz"
        "https://developers.yubico.com/libfido2/Releases/libfido2-${pkgver}.tar.gz.sig")
sha256sums=('0b2e3671c4c5d42fd5604a08e45f89f49592b97cf66d7d3bfbc7e6a4d5a0fec7'
            'SKIP')
validpgpkeys=('EE90AE0D19774C8386628FAAB428949EF7914718')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"
    cmake .. \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
