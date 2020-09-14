# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=1.6.1
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/patroneo.git/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=('glib2' 'jack' 'libsndfile' 'util-linux-libs' 'nuitka')
optdepends=('non-session-manager: Session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('a76280eef2fde483ea3de2cc7bb7ae3df9278d8615fe70bf4b4fdf7908f684e90fed92d80580d5c5b746ca3a69f7cc820dd051ccfa175fb797ad00d0e4921235'
            'SKIP')
b2sums=('232fcbb3d1fec70730aa9a21a9fc730a93d85251cd0e57d950e67741732e602d3e07790d3e092b9af18b8b3b040461802aaca119069b5877451ebee0e1c89f0b'
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
