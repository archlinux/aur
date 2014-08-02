# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mkxp-git
pkgver=r470.151a1f0
pkgrel=1
pkgdesc="Open source implementation of the Ruby Game Scripting System of RPG Maker XP (development version)"
arch=('i686' 'x86_64')
url="https://github.com/Ancurio/mkxp"
license=('GPL2')
depends=('ruby' 'physfs-hg' 'sdl2_image' 'sdl2_ttf' 'sdl_sound-patched-hg'
         'pixman' 'openal' 'boost-libs' 'libgl' 'libsigc++' 'fluidsynth')
makedepends=('git' 'boost' 'cmake' 'mesa' 'vim')
conflicts=('mkxp')
provides=('mkxp')
optdepends=('fluidsynth-git: reduced memory footprint for midi playback')
install=mkxp.install
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd mkxp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mkxp

  cmake ./ -DMRIVERSION=2.1 -DWORKDIR_CURRENT=ON
  make
}

package() {
  cd mkxp

  # install architecture dependent executeable
  install -Dm755 mkxp.bin.x* "$pkgdir"/usr/bin/mkxp

  # install documentation
  install -Dm644 README.md "$pkgdir"/usr/share/doc/mkxp/README.md
  install -m644 mkxp.conf.sample "$pkgdir"/usr/share/doc/mkxp
}
