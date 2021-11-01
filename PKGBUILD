# Maintainer: Mike Cuche <cuche@mailbox.org>
pkgname=dsda-doom-git
pkgver=r5206.7890fdd7
pkgrel=1
pkgdesc="Fork of PrBoom+ with extra tooling for demo recording and playback, with a focus on speedrunning (git version)"
arch=('x86_64')
url="https://github.com/kraflab/dsda-doom"
license=('GPL')
depends=('fluidsynth' 'glu' 'libmad' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'dumb') # temporarily removed 'portmidi'
makedepends=('cmake' 'imagemagick' 'git')
provides=('dsda-doom')
conflicts=('dsda-doom')
source=('git+https://github.com/kraflab/dsda-doom.git')
sha256sums=('SKIP')


pkgver() {
  cd dsda-doom
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/dsda-doom/prboom2"  
	cmake . -DCMAKE_INSTALL_PREFIX=/usr \
	-DWITH_PORTMIDI=Off \
    -DCMAKE_BUILD_TYPE=Release #WITH_PORTMIDI=Off: https://aur.archlinux.org/packages/dsda-doom-git/#comment-833710
	make
}

package() {
  cd "${srcdir}/dsda-doom/prboom2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ICONS/dsda-doom.png "${pkgdir}"/usr/share/pixmaps/dsda-doom.png
  install -Dm644 ICONS/dsda-doom.desktop "${pkgdir}"/usr/share/applications/dsda-doom.desktop
}
