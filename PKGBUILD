# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=shiru.lv2-git
pkgdesc="A set of music plugins created by Shiru, unofficial DPF ports"
pkgver=r46.08853f9
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/linuxmao-org/shiru-plugins"
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
source=(shiru.lv2-git::git+https://github.com/linuxmao-org/shiru-plugins)
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
  mkdir -p ${pkgdir}/usr/lib/lv2
  mv bin/*.lv2/ ${pkgdir}/usr/lib/lv2
}
