# Maintainer: Zhao Jun <wlarekap32 cat protonmail dog com>
# Contributor: <tplasdio cat codeberg dog org>

pkgname=gawk-awkl-git
_pkgname=awkl
pkgdesc="Awk's well-kempt library. Collection of modules to augment gawk functionality"
pkgver=0
pkgrel=1
license=('GPL-3.0-or-later')
url='https://codeberg.org/tplasdio/awkl'
depends=(
 gawk
)
makedepends=(
 git
 automake
 autoconf
 make
)
arch=(any)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd -- "$_pkgname"
	printf "%s.r%s.%s" \
		"$(git describe --abbrev=0 --tags | tr -d v)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd -- "$_pkgname"
	autoreconf -i
	./configure --prefix /usr
	make
}

package() {
	cd -- "$_pkgname"
	make DESTDIR="$pkgdir" install
}
