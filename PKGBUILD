# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko-git
pkgver=0.7.17.r6.g8f4b98bf8
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf (git version)"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('git' 'asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
conflicts=('freedoko')
provides=('freedoko')
source=("git+https://gitlab.com/dknof/FreeDoko.git"
        "freedoko-git-makefiles.patch")
sha256sums=('SKIP'
            '0441c2078aee3774f839519ad9e464bea9ae8dcc4e49130267b207d4cb8a1fbe')

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
