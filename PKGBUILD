# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=2.2.0
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=('x86_64')
url="https://www.laborejo.org/patroneo/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=('glib2' 'jack' 'libsndfile' 'util-linux-libs')
optdepends=('new-session-manager: for session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('82e9c971795e5168bf7667980c861fe4948f7779612244afe9fb69babaca319e27830502ac3c5c8d08562c473a84311606451ffcfae58ff26c7dfb3b80fac67c'
            'SKIP')
b2sums=('07de816d26c7512252922524d171c1235163cbab6e69279e952565d9f588af5711cdc9a802a8676e22f19e946e8ace6a4284c10f105c7fb1234291b0823611ad'
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
