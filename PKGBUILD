# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=2.1.0
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
sha512sums=('a0f5b86eec4c9540271d893df64493bedbf05928b26f97257b849f318e35b8495cc9f4109b9a08259cfe9847878790f482306394e1b624cde69935acde84b457'
            'SKIP')
b2sums=('3da118d8ea8ccd0fbbd598fd37e1d28bee75066071be1ee11cfc1a7ba05cab7e55fa7b78bfe86a509c47adedc016e8caa3d6ede021c39fbb09c6c563d08a71a7'
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
