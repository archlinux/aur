# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=mkxp
pkgname=$_pkgbase-git
pkgver=r319.b8fc5e2
pkgrel=1
pkgdesc="Open source implementation of the Ruby Game Scripting System of RPG Maker XP"
arch=('i686' 'x86_64')
url="https://github.com/Ancurio/mkxp"
license=('GPL2')
depends=('ruby' 'physfs-hg' 'sdl2_image' 'sdl2_ttf' 'sdl_sound-patched-hg'
         'pixman' 'glew' 'openal' 'boost-libs' 'libgl' 'libsigc++')
makedepends=('git' 'boost' 'cmake' 'mesa' 'vim')
conflicts=('mkxp')
provides=('mkxp')
install=$_pkgbase.install
source=($_pkgbase::"git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgbase

  cmake ./
  make
}

package() {
  cd $_pkgbase

  # install architecture dependent executeable
  install -Dm755 $_pkgbase.bin.x* "$pkgdir"/usr/bin/$_pkgbase

  # install documentation
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgbase/README.md
  install -m644 mkxp.conf.sample "$pkgdir"/usr/share/doc/$_pkgbase
}
