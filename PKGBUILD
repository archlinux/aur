# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.6
pkgrel=1

_commit="bd4e25e59d69"
_srcdir="piciji-$pkgname-$_commit"

source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz")
sha256sums=('8c5ad74a65650c95bb0fb3efe774e50ab08679cfc780de9f3fb318ea0171ac34')
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

