# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=njl.lv2-git
pkgdesc="NJL plugins by Nick Lamb ported to the LV2 specification"
pkgver=v0.0.3.r2.gb132f0d
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/linuxmao-org/njl-lv2"
license=(GPL)
groups=(lv2plugins)
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
source=(njl.lv2-git::git+https://github.com/linuxmao-org/njl-lv2)
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
}

build() {
	cd "$pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
  mkdir -p ${pkgdir}/usr/lib/lv2
	make INSTALL_DIR="${pkgdir}/usr/lib/lv2" install-system
}
