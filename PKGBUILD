# Maintainer: David Castellon <bobosito000 at gmail dot com>

pkgname=tpl-git
pkgver=v1.6.1.r16.f8138adr28.f8138ad
pkgrel=2
pkgdesc="C library for C data type serialization."
arch=('i686' 'x86_64')
url="http://troydhanson.github.io/tpl/"
license=('Apache')
# depends=()

makedepends=('make' 'git' 'autoconf')
optdepends=()
provides=('tpl')

source=("tpl"::"git+https://github.com/troydhanson/tpl.git")

sha256sums=('SKIP')
md5sums=()
validpgpkeys=()

pkgver() {
	cd $srcdir/tpl
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

# prepare() {
# 	cd $srcdir/tpl
# }

build() {
	cd $srcdir/tpl
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
  cd $srcdir/tpl
  DESTDIR="$pkgdir" make install
}
