# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.20
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-0.7.20-makefiles.patch")
sha256sums=('c326b260b6199c53db432ec05ca3978d7ad3e87f5f8b1ccfc673ae779eb21ad6'
            '60b28c6cbec994831844d45c43017b3cccb582120e50ce1a8c1e1a774fcfa160')

prepare() {
  cd FreeDoko_$pkgver
  patch -p1 -i ../freedoko-0.7.20-makefiles.patch
}

build() {
  cd FreeDoko_$pkgver

  export CXXFLAGS+=' -std=c++17'

  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver
  make DESTDIR="$pkgdir" install
}
