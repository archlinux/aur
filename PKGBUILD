# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=nyan-doom
pkgver=1.5.0
pkgrel=1
pkgdesc="A cuddly fork of DSDA, with an emphasis on innovative and QoL features."
arch=('x86_64')
url="https://github.com/andrikpowell/nyan-doom"
license=('GPL2')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb' 'portmidi' 'libzip')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/andrikpowell/nyan-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b16e8c195210abf7f44bf681d3def63ad2bcd3615d9cfeeb2ab9236e90c103c')

build() {
	cd "${srcdir}/nyan-doom-${pkgver}/prboom2"  
	cmake . -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
  cd "${srcdir}/nyan-doom-${pkgver}/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ICONS/nyan-doom.png "${pkgdir}"/usr/share/pixmaps/nyan-doom.png
  install -Dm644 ICONS/nyan-doom.desktop "${pkgdir}"/usr/share/applications/nyan-doom.desktop
}
