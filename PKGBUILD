# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=1.7
pkgrel=2
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/patroneo.git/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=('glib2' 'jack' 'libsndfile' 'util-linux-libs' 'nuitka')
optdepends=('non-session-manager: Session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('f2d1dfaad07b61c20c186c20789fbcd471dd74a7bf5a19831d64822fd452e1dc7a5174f28dd3161b86b8c29d67bffb33cac6d43126314ca94e06370d4f0f8ac9'
            'SKIP')
b2sums=('20db86028d67800ad6aeed86eb06450e4637572d3fbb1a1c93c5df2e54482f042f1cbbf4a3b7eb9f6bd66c6be1acee2a739f91afc52ebd4841d78787034646e1'
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
