# Maintainer: Michael Straube <michael.straube@posteo.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.18
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-0.7.18-makefiles.patch")
sha256sums=('5b9ca3ad915f36dba17a4bd22b3d7d68ac2526cf125d045a819aa8d4a2cceb4c'
            '57685adf89e51c0d8103f1395fea7811093ff2030be725cf0cfc72b3f0b98efc')

prepare() {
  cd FreeDoko_$pkgver
  patch -p1 -i ../freedoko-0.7.18-makefiles.patch
}

build() {
  cd FreeDoko_$pkgver
  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/share/doc/freedoko/{de/Windows.txt,en/Windows,hpux*}
}
