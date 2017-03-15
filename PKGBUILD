# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=pict-git
pkgver=r32.890a384
pkgrel=2
pkgdesc="Pairwise Independent Combinatorial Testing"
arch=("x86_64")
url="https://github.com/Microsoft/pict"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'libstdc++5' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/Microsoft/pict.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "${pkgdir}/usr/bin"
	install "${srcdir}/${pkgname%-git}"/pict "${pkgdir}/usr/bin/"
}
