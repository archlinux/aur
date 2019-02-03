# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.19.r35.gdfdaad73f
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (git version)"
arch=('x86_64')
url="http://free-doko.sourceforge.net"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-git-makefiles.patch")
sha256sums=('SKIP'
            '12de37cb742ff26d7a80df9f6fa49b915e4b514578a146b40e1b4ad72b4bd34c')

pkgver() {
  cd FreeDoko
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd FreeDoko
  patch -p1 -i ../freedoko-git-makefiles.patch
}

build() {
  cd FreeDoko

  export CXXFLAGS+=' -std=c++17'

  make compile
  make documentation
}

package() {
  cd FreeDoko
  make DESTDIR="$pkgdir" install
}
