# Maintainer: Mike Cuche <mike@cuche.cc>
pkgname=dsda-doom
pkgver=0.28.0
pkgrel=1
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning"
arch=('x86_64')
url="https://github.com/kraflab/dsda-doom"
license=('GPL')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb' 'portmidi' 'libzip')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/kraflab/dsda-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6efc8d68cc0e9fa2facd2b608779383fcf3a8322edbdb8d7433f0c2adf5a483')

build() {
	cd "${srcdir}/dsda-doom-${pkgver}/prboom2"  
	cmake . -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
  cd "${srcdir}/dsda-doom-${pkgver}/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ICONS/dsda-doom.png "${pkgdir}"/usr/share/pixmaps/dsda-doom.png
  install -Dm644 ICONS/dsda-doom.desktop "${pkgdir}"/usr/share/applications/dsda-doom.desktop
}
