# Maintainer: rustemb <rustemb@systemli.org>

pkgname=carbon-ir-git
pkgver=r142.95caf18
pkgrel=2
pkgdesc="The carbon intermediate representation language."
arch=(x86_64)
url="https://github.com/RobbeDGreef/carbon-ir"
license=('MIT')
depends=(nasm)
makedepends=(cmake make)
provides=('libcarbon-ir.a')
conflicts=(carbon-ir)
replaces=(carbon-ir)
options=(staticlibs)
source=("carbon-ir-git::git+https://github.com/RobbeDGreef/carbon-ir.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
  mkdir build
	./build.sh
  ./buildlib.sh
}

package() {
	cd "$pkgname"
  mkdir -p ${pkgdir}/usr/{bin,lib,share}
  cp carbon-ir ${pkgdir}/usr/bin
  cp libcarbon-ir.a ${pkgdir}/usr/lib
  mkdir -p ${pkdir}/usr/share/carbon-ir
  cp LICENSE ${pkdir}/usr/share/carbon-ir
  cp -r docs ${pkdir}/usr/share/carbon-ir
}
