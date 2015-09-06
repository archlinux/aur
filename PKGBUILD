# Maintainer: jpate <jkpate@jkpate.net>
pkgname=praat
pkgver=5.4.17
pkgrel=1
pkgdesc="A tool for 'Doing Phonetics by computer'"
arch=('x86_64' 'i686')
url="http://www.fon.hum.uva.nl/praat/"
license=('GPL')
depends=( 'alsa-lib' 'gtk2' )
makedepends=( 'pkg-config' )
optdepends=( 'ttf-sil-fonts' )
source=("http://www.fon.hum.uva.nl/praat/praat5417_sources.tar.gz")
md5sums=('67b179527bbcbfad35def03ff33f6537')

prepare() {
  cd "$srcdir/sources_5417/"

  cp makefiles/makefile.defs.linux.alsa makefile.defs

  sed -i '/setenv ("PULSE_LATENCY_MSEC"/d' sys/praat.cpp
}

build() {
  cd "$srcdir/sources_5417/"

  make
}

package() {
  cd "$srcdir/sources_5417/"

  install -Dm755  praat "$pkgdir/usr/bin/praat"
}

