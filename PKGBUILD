# Maintainer: Mike Cuche <cuche@gmx.com>
pkgname=dsda-doom-git
pkgver=r3506.681a31f7
pkgrel=1
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning (git version)"
arch=('x86_64')
url="https://github.com/kraflab/dsda-doom"
license=('GPL')
depends=('fluidsynth' 'glu' 'libmad' 'portmidi' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb')
makedepends=('cmake' 'deutex' 'imagemagick' 'git')
provides=('prboom-plus')
conflicts=('prboom-plus')
source=('git+https://github.com/kraflab/dsda-doom.git'
'prboom-plus.svg')
sha256sums=('SKIP'
'be9670d095570bde98b651b0f263b7dd41b63158da9bbd84c4dfe6d6a3e4da1e')


pkgver() {
  cd dsda-doom
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/dsda-doom/prboom2"  
	cmake . -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
  cd "${srcdir}/dsda-doom/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/prboom-plus.svg "${pkgdir}"/usr/share/pixmaps/prboom-plus.svg
  install -Dm644 ICONS/prboom-plus.desktop "${pkgdir}"/usr/share/applications/prboom-plus.desktop
}
