# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise-git'
_pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator - Git version'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=2.4.r34.g15220c4
pkgrel=2
epoch=2
source=('git+https://bitbucket.org/piciji/denise.git')
sha256sums=('SKIP')
provides=('denise')
conflicts=('denise')
depends=('libpulse' 'openal' 'gtk3')
makedepends=('git' 'cmake')
arch=('x86_64')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B builds/release
  cmake --build builds/release
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="${pkgdir}" cmake --build builds/release --target install
}

