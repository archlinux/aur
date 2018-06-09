# Contributor: foutrelis 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Philipp Sandhaus <philipp.sandhaus@gmx.de>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Gnud <ach.gnud@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=denemo-git
pkgver=r10476
pkgrel=1
pkgdesc="A music score editor"
arch=('x86_64')
url="http://www.denemo.org"
license=('GPL')
depends=('aubio' 'lilypond' 'gtk3' 'libxml2' 'fftw' 'librsvg' 'fluidsynth'
	 'libsmf' 'evince' 'gtksourceview3' 'portmidi' 'guile2.0')
makedepends=('intltool' 'git' 'rubberband')
source=("git://git.savannah.gnu.org/denemo.git")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd ${pkgname%-git}	
  printf r%s $(git rev-list --count HEAD)
}

# prepare() {
#   cd ${pkgname%-git}	  
#   patch -Np1 < "$srcdir"/no_portaudio.patch
# }

build() {
  cd ${pkgname%-git} 
  [ -x configure ] || ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-portaudio
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
md5sums=('SKIP')
