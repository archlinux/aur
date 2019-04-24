# Maintainer: Alexandros Theodotou <alex@zrythm.org>
pkgname=zrythm
pkgver=0.4.053
pkgrel=1
pkgdesc="An highly automated, intuitive, Digital Audio Workstation (DAW)"
arch=( 'x86_64' )
url='https://git.zrythm.org/zrythm/zrythm'
license=( 'GPL3' )
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack'
  'libsndfile' 'libyaml' 'gettext' 'qt5-base'
  'libsamplerate' 'alsa-lib' 'ffmpeg' 'portaudio'
  'ladspa' 'fftw')
makedepends=('python' 'gettext' 'sed' 'libtool')
conflicts=( 'zrythm-git' )
source=( "https://git.zrythm.org/zrythm/${pkgname}/-/archive/v$pkgver/${pkgname}-v$pkgver.tar.gz" )
md5sums=( '573b3501859ba8b5361c01a83d17b23d' )

rootdir="${pkgname}-v${pkgver}"

build() {
  cd ${rootdir}/
  autoreconf -fi
  ./configure --prefix=/usr --with-qt5 --with-ffmpeg
  make
}

package() {
  cd ${rootdir}/
  make DESTDIR="${pkgdir}/" install
}
