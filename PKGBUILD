# Maintainer: Alejandro Barocio A. <abarocio80@gmail.com>
pkgbase=searchweb
pkgname=searchweb-git
pkgver=0.0.r6.gb779a55
pkgrel=1
epoch=
pkgdesc="A web search cache with menu and tagged history."
arch=(any)
url="https://gitlab.com/abarocio80/searchweb.git"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+"$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "searchweb"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "searchweb"
	make
}

package() {
	cd "searchweb"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
