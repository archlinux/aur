# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.18.r74.g764532f00
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (git version)"
arch=('x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-git-makefiles.patch")
sha256sums=('SKIP'
            '8274a493a07d38e7a3bd8f2b8a7b1c6a921403221297e99eea96a535e69c52e3')

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
  rm "$pkgdir"/usr/share/doc/freedoko/{de/Windows.txt,en/Windows,hpux*}
}
