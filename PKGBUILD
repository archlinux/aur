# Maintainer: That One Seong <thatoneseong@protonmail.com>

_pkgname=supermodel
pkgname=$_pkgname-sinden-git
pkgver=r140.711ecc6
pkgrel=1
pkgdesc='A Sega Model 3 Arcade Emulator, patched for multiple mice support and Sinden borders'
arch=('i686' 'x86_64')
url='http://www.supermodel3.com/'
license=('GPL3')
depends=('mesa' 'sdl' 'zlib' 'glu' 'sdl2_net')
makedepends=('git')
provides=('supermodel-git')
conflicts=('supermodel-git')
install=supermodel-sinden.install
source=("$_pkgname::git+https://github.com/DirtBagXon/model3emu-code-sinden.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make -f 'Makefiles/Makefile.UNIX'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "bin/supermodel" "$pkgdir/usr/bin/supermodel"

  install -Dm644 "Docs/LICENSE.txt" "$pkgdir/usr/share/licenses/supermodel/LICENSE"
  install -Dm644 "Docs/README.txt" "$pkgdir/usr/share/doc/supermodel/README"

  install -d "$pkgdir/usr/share/supermodel/Config"
  install -m644 Config/* "$pkgdir/usr/share/supermodel/Config/"
}
