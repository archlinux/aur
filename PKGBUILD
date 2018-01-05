# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.7.17
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "freedoko-archlinux.patch")
sha256sums=('db686536e479d3a3349dc7db1754f369d14cee02a60c9afddd004e017cf022e6'
            '7ff4bd0a374e744b619ad1c1175756c6cc35eb38df14ceb66ba8b2ff5c5acb3d')

prepare() {
  cd FreeDoko_$pkgver
  patch -p1 -i ../freedoko-archlinux.patch
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
