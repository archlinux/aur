# Maintainer: Mike Cuche <cuche@gmx.com>
pkgname=dsda-doom-git
pkgver=r3718.0cbfc803
pkgrel=1
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning (git version)"
arch=('x86_64')
url="https://github.com/kraflab/dsda-doom"
license=('GPL')
depends=('fluidsynth' 'glu' 'libmad' 'portmidi' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb')
makedepends=('cmake' 'deutex' 'imagemagick' 'git')
provides=('dsda-doom')
conflicts=('dsda-doom' 'prboom-plus')
source=('git+https://github.com/kraflab/dsda-doom.git'
'dsda-doom.desktop')
sha256sums=('SKIP'
'31944f60e6cf45db60d63dd6538e0d21bade193646f28b000fa8c2f1d9672dbf')


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
  install -Dm644 ICONS/dsda-doom.png "${pkgdir}"/usr/share/pixmaps/dsda-doom.png
  install -Dm644 ${srcdir}/dsda-doom.desktop "${pkgdir}"/usr/share/applications/dsda-doom.desktop
}
