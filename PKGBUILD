# Maintainer: Maks Verver <maks@verver.ch>
pkgname=sqlfuse-git
pkgver=r179.a2f60b6
pkgrel=1
pkgdesc="Encrypted user-space filesystem using SQLite3+SQLCipher+FUSE"
arch=('i686' 'x86_64')
url="https://github.com/maksverver/sqlfuse"
license=('unknown')
groups=()
depends=('fuse' 'sqlcipher')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/maksverver/sqlfuse.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -t "${pkgdir}/usr/bin" sqlfuse
}
