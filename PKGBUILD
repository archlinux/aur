# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=nyan-doom
pkgver=1.6.0
pkgrel=1
pkgdesc="A fork of DSDA, with an emphasis on innovative and QoL features."
arch=('x86_64')
url="https://github.com/andrikpowell/nyan-doom"
license=('GPL2')
depends=('glu' 'libspng' 'sdl2-compat' 'sdl2_mixer' 'libzip')
optdepends=('fluidsynth' 'libmad' 'limxmp' 'dumb' 'portmidi')
makedepends=('cmake' 'imagemagick')
source=("https://github.com/andrikpowell/nyan-doom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de91ec083cb70d56ee106d8a4a2568c0436f2edb277729a51ec05804ed5eb7a4')

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
