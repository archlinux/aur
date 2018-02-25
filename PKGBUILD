# Contributor: foutrelis 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Philipp Sandhaus <philipp.sandhaus@gmx.de>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Gnud <ach.gnud@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=denemo
pkgver=2.2.0
pkgrel=4
pkgdesc="A music score editor"
arch=('x86_64')
url="http://www.denemo.org"
license=('GPL')
depends=('aubio' 'lilypond' 'gtk3' 'libxml2' 'fftw' 'librsvg' 'fluidsynth'
	 'libsmf' 'evince' 'gtksourceview3' 'portmidi' 'guile2.0')
makedepends=('intltool' 'git' 'rubberband')
noextract=(${pkgname}-${pkgver}.tar.gz)
validpgpkeys=('C66734FA5D60E4DDD882EF81AE6F83BB6C574235') # Jeremiah Benham, AE6F83BB6C574235
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig} no_portaudio.patch)
sha256sums=('d07d7c5bce5569e25fceb02727f5c8f4ff2f579947b612e2bf9b48573bd1eca3'
            'SKIP'
            '0266e1c88f7829fbc0990dc3f3f7d55abdbea1f73d3b9a41728cc41682427eb5')

prepare() {
  cd "$srcdir"
  LC_ALL=en_US.UTF-8 tar xzf ${pkgname}-${pkgver}.tar.gz
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/no_portaudio.patch
}

build() {
  cd $pkgname-$pkgver
  [ -x configure ] || ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-portaudio
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
