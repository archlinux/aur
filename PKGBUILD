# Maintainer: Peter Babič <peter@babic.dev>
pkgname=microxml-git
_pkgname=microxml
pkgver=r3.80a1516
pkgrel=1
pkgdesc="Small XML parsing library"
arch=('any')
url="https://github.com/pivasoftware/${_pkgname}"
license=('LGPL2')
makedepends=(
	'git' 
	'gcc' 
	'make'
)
provides=(
	'libmicroxml'
	'microxml'
)
conflicts=(
	'libmicroxml'
	'microxml'
)
source=("git+https://github.com/pivasoftware/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	autoconf -i
	./configure --prefix=/usr --enable-threads --enable-shared --enable-static
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make BUILDROOT="$pkgdir/" install
}
