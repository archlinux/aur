# Maintainer: hokkjoy <hokkjoy@pickaxelinux.org>
pkgname=randomx-git
pkgver=r398.5ce5f49
pkgrel=1
pkgdesc="RandomX: The proof of work algorithm based on random code execution"
arch=('x86_64')
url="https://github.com/tevador/RandomX"
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/tevador/RandomX.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
#	cd "$srcdir/${pkgname%-git}"
	cd "$srcdir/RandomX"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "$srcdir/RandomX/build"
#	cd "$srcdir/${pkgname%-git}"
#	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
#	cd "$srcdir/${pkgname%-git}"
	cd "$srcdir/RandomX/build"
	cmake -DARCH=native ..
	make
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#	make -k check
#}

package() {
#	cd "$srcdir/${pkgname%-git}"
	cd "$srcdir/RandomX"
#	make DESTDIR="$pkgdir/" install
	install -Dm755 "${srcdir}/RandomX/build/randomx-benchmark" "${pkgdir}/usr/bin/randomx-benchmark"
	install -Dm755 "${srcdir}/RandomX/build/randomx-codegen" "${pkgdir}/usr/bin/randomx-codegen"
	install -Dm755 "${srcdir}/RandomX/build/randomx-tests" "${pkgdir}/usr/bin/randomx-tests"
}
