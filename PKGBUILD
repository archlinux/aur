# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=alsaplayer-git
pkgver=r1456.47670c7
pkgrel=1
pkgdesc="A heavily multi-threaded PCM player that tries to excercise the ALSA library and driver quite a bit"
arch=('i686' 'x86_64')
url="http://alsaplayer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils')
makedepends=('gtk2' 'libid3tag' 'libvorbis' 'libmad' 'libmikmod' 'jack' 'mesa' 'audiofile' 'doxygen' 'git')
optdepends=('gtk2: for the gtk2 GUI interface'
            'libgl: for the OpenGL visual plugins'
            'jack: for JACK audio server output support'
            'audiofile: for support of various audio formats like AIFF, WAVE, .snd/.au'
            'libid3tag: for flac support'
            'flac: for flac support'
            'libmad: for MPEG support'
            'libsndfile: for sndfile support'
            'libvorbis: for ogg vorbis support'
            'libmikmod: for mod, s3m, it and xm formats supports')
provides=('alsaplayer')
conflicts=('alsaplayer')
source=("${pkgname}::git+https://github.com/alsaplayer/alsaplayer.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  sh autogen.sh
  ./configure --prefix=/usr --enable-audiofile
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
