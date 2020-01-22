# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
_pkgname="bjumblr.lv2"
pkgname="${_pkgname}-git"
pkgdesc="Pattern-controlled audio stream re-sequencer LV2 plugin"
pkgver=r132.c004205
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/sjaehn/BJumblr"
license=(GPL)
groups=()
depends=('lv2')
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
source=("bjumblr.lv2::git+https://github.com/sjaehn/BJumblr")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$_pkgname"
}

build() 
{
	cd "$_pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
