# Maintainer: Alexandros Theodotou <alex@zrythm.org>
pkgname=zrythm
pkgver=0.5.007
pkgrel=1
pkgdesc="An highly automated, intuitive, Digital Audio Workstation (DAW)"
arch=( 'x86_64' )
url='https://git.zrythm.org/zrythm/zrythm'
license=( 'GPL3' )
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack'
  'libsndfile' 'libyaml' 'gettext' 'qt5-base'
  'libsamplerate' 'alsa-lib' 'portaudio'
  'ladspa' 'fftw')
makedepends=('python' 'gettext' 'sed'
             'meson' 'ninja')
conflicts=( 'zrythm-git' )
source=( "https://git.zrythm.org/zrythm/${pkgname}/-/archive/v$pkgver/${pkgname}-v$pkgver.tar.gz" )
md5sums=( '0f54a1b6228373841078331dd345f25a' )

rootdir="${pkgname}-v${pkgver}"

build() {
  cd ${rootdir}/
  mkdir -p build
  cd build && meson --prefix=/usr .. -Denable_tests=true
  ninja
}

check() {
  cd ${rootdir}/
  cd build && ninja test
}

package() {
  cd ${rootdir}/
  cd build && DESTDIR="${pkgdir}/" ninja install
}
