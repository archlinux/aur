# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.5
pkgrel=1

_commit="3f3d63961612"
_srcdir="piciji-$pkgname-$_commit"

source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz")
sha256sums=('fd78aa7eeab9889001d4a43cfc06ae89ff3e1f317b0cdad9ee6604fcb0a116b2')
depends=('gtk3' 'openal' 'libpulse')
makedepends=('cmake')
arch=('x86_64')

build() {
  cd "$srcdir/$_srcdir"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B builds/release
  cmake --build builds/release
}

package() {
  cd "$srcdir/$_srcdir"
  DESTDIR="${pkgdir}" cmake --build builds/release --target install
}

