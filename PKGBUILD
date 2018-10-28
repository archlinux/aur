# Maintainer: Eric Van Albert <eric@van.al>

pkgname=radiance
pkgver=20181013
pkgrel=0
pkgdesc='Video art software for live performance'
arch=('x86_64')
url='https://radiance.video'
license=('MIT')
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'fftw' 'libsamplerate' 'mpv' 'portaudio' 'rtmidi' 'youtube-dl')
makedepends=('cmake')
source=('https://github.com/zbanks/${pkgname}/archive/continuous.tar.gz'
'https://github.com/zbanks/BTrack/archive/master.tar.gz')
sha256sums=('d5cc1c66a4df834b4c3f931c42c20755f11f169e7cdbe13b060f765b4aac5149'
'31d3e919deddc0e6938e68af420243847756c5fb18923ec6b4e23ab81cda658f')

build() {
  rm -rf "${srcdir}/${pkgname}-continuous/BTrack"
  mv "${srcdir}/BTrack-master" "${srcdir}/${pkgname}-continuous/BTrack"
  cd "${srcdir}/${pkgname}-continuous"
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DRADIANCE_SYSTEM_RESOURCES=/usr/share/radiance
  make -j7
}

package() {
  cd "${srcdir}/${pkgname}-continuous/build"
  make install
}
