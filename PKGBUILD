# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.9
pkgrel=1

source=("$pkgname-$pkgver.tar.gz::https://github.com/piciji/denise/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d72d5a989ff4f62dd200964bb76ead8f6f5a2993be3e121085942e7093a5b023')
depends=('gtk3' 'openal' 'libpulse' 'libusb')
makedepends=('cmake')
arch=('x86_64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B builds/release
  cmake --build builds/release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="${pkgdir}" cmake --build builds/release --target install
  rm -fr "${pkgdir}"/usr/share/appdata
}

