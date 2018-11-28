# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.18.r151.g89d5f1d0f
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
            'f5df5ab9524d4689d09085e6f1e2c582d3fae80ac70d7d95ca19567fcd0d249e')

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
  make compile
  make documentation
}

package() {
  cd FreeDoko
  make DESTDIR="$pkgdir" install
}
