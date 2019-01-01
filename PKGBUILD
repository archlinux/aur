# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.19
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-0.7.19-makefiles.patch")
sha256sums=('1969619c35fd5f950dd817d5652780d76b82de0a283ea4d6b3e266a6a122e717'
            '3abf36eb77aa0490d5e80bdc3fe9796bef2ab6718caebebef168a53f8044dd1e')

prepare() {
  cd FreeDoko_$pkgver
  patch -p1 -i ../freedoko-0.7.19-makefiles.patch
}

build() {
  cd FreeDoko_$pkgver
  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver
  make DESTDIR="$pkgdir" install
}
