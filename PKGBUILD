# Maintainer: Samuele Santi <samuele.santi@reinventsoftware.io>

pkgname=canboat-git
pkgver=1.2.1.r43.deaa4c2
pkgrel=1
pkgdesc="NMEA 2000 and NMEA 0183 utilities"
arch=('x86_64')
url="https://github.com/canboat/canboat/"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('canboat::git+https://github.com/canboat/canboat.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	# make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" EXEC_PREFIX="/opt/${pkgname%-git}" install
}
