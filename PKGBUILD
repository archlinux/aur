# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.7
pkgrel=2

_commit="500936ad0f81"
_srcdir="piciji-$pkgname-$_commit"

source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/piciji/denise/get/v$pkgver.tar.gz")
sha256sums=('4488cb7548ff407a6c08978049a5278d17f423bcd184fb3aebd1ab701f7d5cf3')
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

