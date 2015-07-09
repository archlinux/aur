# Maintainer: jpate <jkpate@jkpate.net>
pkgname=praat
pkgver=5.4.11
pkgrel=1
pkgdesc="A tool for 'Doing Phonetics by computer'"
arch=('x86_64' 'i686')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=( 'alsa-lib' 'gtk2' )
makedepends=( 'pkg-config' )
optdepends=( 'ttf-sil-fonts' )
source=("http://www.fon.hum.uva.nl/praat/praat5411_sources.tar.gz")
md5sums=('23d1903e866b1a193e2c1f95af00c1a2')

prepare() {
  cd "$srcdir/sources_5411/"

  cp makefiles/makefile.defs.linux.alsa makefile.defs

  # current release seems to have eliminated ipaSerifRegular24.cpp
  sed -i 's/ ipaSerifRegular24.o//' kar/Makefile
}

build() {
  cd "$srcdir/sources_5411/"

  make
}

package() {
  cd "$srcdir/sources_5411/"

  install -Dm755  praat "$pkgdir/usr/bin/praat"
}

