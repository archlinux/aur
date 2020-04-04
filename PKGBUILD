# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=nanoinvaders.lv2-git
pkgdesc="Play space invaders in an audio plugin (alpha)"
pkgver=r3.eb2fbab
pkgrel=1
epoch=
arch=(x86_64)
url=""
license=(GPL)
groups=()
depends=(lv2)
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
source=(nanoinvaders.lv2-git::git+https://github.com/clearly-broken-software/nanoinvaders)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
  mkdir -p "$pkgdir"/usr/lib/lv2
  mv bin/nanoinvaders.lv2 "$pkgdir"/usr/lib/lv2 
}
