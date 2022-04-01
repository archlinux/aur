# Maintainer: Mike Cuche <cuche AT mailbox.org>
pkgname=dsda-doom
pkgver=0.24.3
pkgrel=1
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning"
arch=('x86_64')
url="https://github.com/kraflab/dsda-doom"
license=('GPL')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb')  # temporarily removed 'portmidi'
makedepends=('cmake' 'imagemagick')
source=("https://github.com/kraflab/dsda-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4cfc82eea029068329d6b6a2dcbe0b316b31a60af12e6dc5ad3e1d2c359d913')

build() {
	cd "${srcdir}/dsda-doom-${pkgver}/prboom2"  
	cmake . -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr \
	-DWITH_PORTMIDI=Off -DWITH_DUMB=Off \
    -DCMAKE_BUILD_TYPE=Release #WITH_PORTMIDI=Off: https://aur.archlinux.org/packages/dsda-doom-git/#comment-833710
	make
}

package() {
  cd "${srcdir}/dsda-doom-${pkgver}/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ICONS/dsda-doom.png "${pkgdir}"/usr/share/pixmaps/dsda-doom.png
  install -Dm644 ICONS/dsda-doom.desktop "${pkgdir}"/usr/share/applications/dsda-doom.desktop
}
