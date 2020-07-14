# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=1.6
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/patroneo.git/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=('glib2' 'jack' 'libsndfile' 'libutil-linux' 'nuitka')
optdepends=('non-session-manager: Session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('5f3767122141df4dd6beba4df175e02a9e1105c1e6b5bf0869f4c3d254a1096cfab3d54feace1f45a1c6037853e49bc174fa6e4f3e4b92c61026c8d9aaf12ccd'
            'SKIP')
b2sums=('1a373459128780e7269f284dc5857570a18f5af136332dbe76e32e0cc61277d5b32343eb1692da46a3df9c7c8730e3e77124adc6694145ea90628b02ebf14b28'
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
