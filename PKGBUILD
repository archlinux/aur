# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=1.5
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
sha512sums=('6f1182babdad13f4b49a7ac490ae74710e8fa87245f6644f8a092b58f7fab66085421c138c015f688cfafe35dcb902c3a4cf537d39b526302f157c44830946ca'
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
