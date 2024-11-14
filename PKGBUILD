# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.4
pkgrel=3

_commit="b6c5ac2d604e"
_srcdir="piciji-$pkgname-$_commit"

source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz")
sha256sums=('4d65c1c298d5978616f227e5546eb2e8115d3cee5c5c057371d0852b69a0e920')
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

