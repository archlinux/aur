# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_name=mkxp
pkgname=$_name-git
pkgver=r403.843a7bf
pkgrel=1
pkgdesc="Open source implementation of the Ruby Game Scripting System of RPG Maker XP (development version)"
arch=('i686' 'x86_64')
url="https://github.com/Ancurio/mkxp"
license=('GPL2')
depends=('ruby' 'physfs-hg' 'sdl2_image' 'sdl2_ttf' 'sdl_sound-patched-hg'
         'pixman' 'openal' 'boost-libs' 'libgl' 'libsigc++')
makedepends=('git' 'boost' 'cmake' 'mesa' 'vim')
conflicts=('mkxp')
provides=('mkxp')
install=$_name.install
source=($_name::"git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_name

  cmake ./ -DMRIVERSION=2.1
  make
}

package() {
  cd $_name

  # install architecture dependent executeable
  install -Dm755 $_name.bin.x* "$pkgdir"/usr/bin/$_name

  # install documentation
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_name/README.md
  install -m644 mkxp.conf.sample "$pkgdir"/usr/share/doc/$_name
}
