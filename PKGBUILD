# Maintainer: Eric Van Albert <eric@van.al>

pkgname=radiance
pkgver=0.6.0
pkgrel=1
pkgdesc='Video art software for live performance'
arch=('x86_64')
url='https://radiance.video'
license=('MIT')
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'fftw' 'libsamplerate' 'mpv' 'portaudio' 'rtmidi' 'youtube-dl')
makedepends=('cmake')
btrack_pkgver='stable-201810'
source=("https://github.com/zbanks/radiance/archive/${pkgver}.tar.gz"
"https://github.com/zbanks/BTrack/archive/${btrack_pkgver}.tar.gz")
sha256sums=('1b4be7cfecff3e8ec18e28033ebdedcc3801cb8088b9d41514ae183d0c6ccb67'
'8c265f565358e35f26eb7b38c3caa09d551ddb5b0aff18045a9714e6f1829bcc')

build() {
  rm -rf "${srcdir}/${pkgname}-${pkgver}/BTrack"
  mv "${srcdir}/BTrack-${btrack_pkgver}" "${srcdir}/${pkgname}-${pkgver}/BTrack"
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DRADIANCE_SYSTEM_RESOURCES=/usr/share/radiance/
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make install
}
