# Maintainer: Alexandros Theodotou <alex@zrythm.org>
_pkgname=zrythm
pkgname=$_pkgname-git
pkgver=0.4.151.r2.g58e3f445
pkgrel=1
pkgdesc="An highly automated, intuitive, Digital Audio Workstation (DAW)"
arch=( 'x86_64' )
url='https://git.zrythm.org/zrythm/zrythm'
license=( 'GPL3' )
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack'
  'libsndfile' 'libyaml' 'gettext' 'qt5-base'
  'libsamplerate' 'alsa-lib' 'ffmpeg' 'libgtop'
  'portaudio' 'ladspa' 'fftw')
makedepends=('python' 'gettext' 'sed' 'git' 'libtool')
conflicts=( "$_pkgname" )
provides=( "$_pkgname" )
source=("$_pkgname::git+https://git.zrythm.org/zrythm/zrythm.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "%s" "$(git describe --tags | sed 's/-/\.r/' | sed 's/v//g' | sed 's/-/\./')"
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf -fi
  ./configure --prefix=/usr --with-ffmpeg --with-qt5
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}/" install
}
