# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.8
pkgrel=1

_commit="092eaae533ec"
_srcdir="piciji-$pkgname-$_commit"

source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz")
sha256sums=('50cf89e12c43cabc7e55f2f4da501d5642ad55e6022b135c1d982afb29937588')
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
  rm -fr "${pkgdir}"/usr/share/appdata
}

