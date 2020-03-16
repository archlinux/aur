# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=omins.lv2-git
pkgdesc="Omins plugins for modular LV2 hosts"
pkgver=r67.058f341
pkgrel=1
epoch=
arch=(x86_64)
url="http://git.drobilla.net/cgit.cgi/omins.lv2.git"
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
source=(omins.lv2-git::git+http://git.drobilla.net/cgit.cgi/omins.lv2.git)
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
  ./waf configure --prefix=/usr 
}

build() {
	cd "$pkgname"
	./waf
}

package() {
	cd "$pkgname"
	./waf install --destdir="$pkgdir"

}
