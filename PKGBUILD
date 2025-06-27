# Maintainer: Mike Cuche <mike@cuche.cc>
pkgname=dsda-doom
pkgver=0.29.2
pkgrel=1
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning"
arch=('x86_64')
url="https://github.com/kraflab/dsda-doom"
license=('GPL')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb' 'portmidi' 'libzip')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/kraflab/dsda-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f1950d6b2974f00d1a2d23128f59fc7afac904939b7f275a4e44e4775d14ecc')

build() {
	cd "${srcdir}/dsda-doom-${pkgver}/prboom2"  
	cmake . -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
  cd "${srcdir}/dsda-doom-${pkgver}/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ICONS/dsda-doom.svg "${pkgdir}"/usr/share/pixmaps/dsda-doom.svg
  install -Dm644 ICONS/dsda-doom.desktop "${pkgdir}"/usr/share/applications/dsda-doom.desktop
}
