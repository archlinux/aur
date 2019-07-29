# Maintainer: Eric Van Albert <eric@van.al>

pkgname=radiance
pkgver=0.6.1
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
sha256sums=('cfc3281abe61ee9a5efba67d682b212bb75cb7197ff65ee0eff0d30577011163'
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
