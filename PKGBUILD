# Maintainer: Mike Cuche <mike@cuche.cc>
pkgname=dsda-doom
pkgver=0.30.1
pkgrel=2
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning"
arch=('x86_64')
url="https://github.com/dsda-org/dsda-doom"
license=('GPL-2.0-or-later')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'libxmp' 'portmidi' 'libzip')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/dsda-org/dsda-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8b14d5e6f5aba66745cb682297fe3aa97f3ef158d7f876798dd213a82e1de40')

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
