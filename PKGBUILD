# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname='denise-git'
_pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator - Git version'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL-3.0-or-later')
pkgver=r1796.0c7a30f
pkgrel=1
epoch=1
source=('git+https://bitbucket.org/piciji/denise.git')
sha256sums=('SKIP')
provides=('denise')
conflicts=('denise-bin' 'denise')
depends=('libpulse' 'openal' 'gtk3')
makedepends=('git')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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

