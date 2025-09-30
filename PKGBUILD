# Maintainer: kinker31 <dp223171@gmail.com>
#Thanks for lettin' me borrow some of your code, Mike Cuche <mike@cuche.cc>
pkgname=nyan-doom-git
pkgver=r10575.2d3ef59b1
pkgrel=1
pkgdesc="A cuddly fork of DSDA, with an emphasis on innovative and QoL features. (Git Version)"
arch=('x86_64')
url="https://github.com/andrikpowell/nyan-doom"
license=('GPL2')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb' 'portmidi' 'libzip')
makedepends=('cmake' 'imagemagick')
source=("git+https://github.com/andrikpowell/nyan-doom.git")
sha256sums=('SKIP')

pkgver() {
  cd nyan-doom
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/nyan-doom/prboom2"  
	cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
	make -j$(nproc)
}

package() {
  cd "${srcdir}/nyan-doom/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ICONS/nyan-doom.png "${pkgdir}"/usr/share/pixmaps/nyan-doom.png
  install -Dm644 ICONS/nyan-doom.desktop "${pkgdir}"/usr/share/applications/nyan-doom.desktop
}
