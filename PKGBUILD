# Maintainer: Mike Cuche <cuche AT mailbox.org>
pkgname=dsda-doom
pkgver=0.27.3
pkgrel=1
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning"
arch=('x86_64')
url="https://github.com/kraflab/dsda-doom"
license=('GPL')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb' 'portmidi' 'libzip')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/kraflab/dsda-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('956194c5dbbd8be5b62ca93cb975a6dbacdfc3ca97165c4da65a07843092b297')

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
