# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Marek Maškarinec <marek@mrms.cz>
pkgname='umka-lang-git'
pkgver=1.2.r24.e55d43f
pkgrel=1
pkgdesc="Embeddable statically typed scripting language"
arch=('x86_64')
url="https://github.com/vtereshkov/umka-lang"
license=('custom:BSD-2-Clause')
groups=()
depends=('glibc')
makedepends=('git' 'make' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/vtereshkov/umka-lang')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"

	mkdir -p "$pkgdir/usr/bin"
	cp build/umka "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/lib"
	cp build/libumka.so "$pkgdir/usr/lib"

	mkdir -p "$pkgdir/usr/include"
	cp src/umka_api.h "$pkgdir/usr/include"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
