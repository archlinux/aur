# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=gator.lv2-git
pkgdesc="A programmable gate plugin using DPF."
pkgver=r5.80b7a43
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/rghvdberg/gator"
license=(GPL)
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/rghvdberg/gator)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd gator
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd gator
  git submodule update --init --recursive
}

build() {
  cd gator
	# ./configure --prefix=/usr
	make
}

package() {
  cd gator/bin
  mkdir -p ${pkgdir}/usr/bin/lv2
  mv gator.lv2 ${pkgdir}/usr/bin/lv2 
}
