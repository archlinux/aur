# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=2.0.0
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/patroneo.git/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=('glib2' 'jack' 'libsndfile' 'util-linux-libs')
optdepends=('new-session-manager: for session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('03b5be3301b3d940c90506ff3ecd28097b256e7e0cd7f3a9d2c1e17598c82fd7be0541b2c0e640971b3cb2e4168350a3b9b65913845b4bdace19681b09dedecb'
            'SKIP')
b2sums=('dec29a390fe70fa3ea62c9c0480114a5c6ea251591531f572db1e6666e1a82a0b6b8e0427d33fa6f4ed417d5073a7e4c259da63b3db30591b03132309702da03'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  depends+=('libglib-2.0.so' 'libjack.so' 'libsndfile.so' 'libuuid.so')
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
