# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Philipp Sandhaus <philipp.sandhaus@gmx.de>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Gnud <ach.gnud@gmail.com>

pkgname=denemo
epoch=1
pkgver=2.2.0
pkgrel=1
pkgdesc="A music score editor"
arch=('x86_64')
url="http://www.denemo.org"
license=('GPL')
depends=('aubio' 'portaudio' 'lilypond' 'gtk3' 'libxml2' 'guile' 'fftw'
	 'librsvg' 'fluidsynth' 'libsmf' 'evince' 'gtksourceview3' 'portmidi'
	 'rubberband')
makedepends=('intltool' 'git')
noextract=(${pkgname}-${pkgver}.tar.gz)
validpgpkeys=('C66734FA5D60E4DDD882EF81AE6F83BB6C574235')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('d07d7c5bce5569e25fceb02727f5c8f4ff2f579947b612e2bf9b48573bd1eca3'
            'SKIP')

prepare() {
  cd "$srcdir"
  LC_ALL=en_US.UTF-8 tar xzf ${pkgname}-${pkgver}.tar.gz
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|<audio.h>|<portaudio.h>|' src/audio/pitchrecog.c
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  [ -x configure ] || ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
