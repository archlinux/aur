# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.20.r0.g355bd7ba8
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
            '405927bdcdf22ba06c044cd616af0eb4977a7b0df39d932a7fc7f2128ff33a6a')

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
