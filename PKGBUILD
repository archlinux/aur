# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=lenticular.lv2
pkgdesc="Ports of VCV Rack modules to LV2"
pkgver=r78.c4281c0
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/polyeffects/lenticular_lv2"
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
source=(lenticular.lv2::git+https://github.com/polyeffects/lenticular_lv2)
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
	make DESTDIR="$pkgdir/" install
}
