# Maintainer: Julian Daube <julian (at) daube (dot) xyz>
# Contributor: Julian Daube <julian (at) daube (dot) xyz>

_pkgname=istyle-verilog-formatter
pkgname=$_pkgname-git
pkgver=1.23.r13.ge368dee
pkgrel=1
pkgdesc="Automatic formatter for Verilog source code"
arch=("x86_64")
url="https://github.com/thomasrussellmurphy/istyle-verilog-formatter"
license=("GPL-2.0-or-later")
depends=("glibc" "libgcc" "libstdc++")
makedepends=("git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	git -C "$srcdir/$_pkgname" clean -dfx
}

build() {
	cd "$_pkgname"
	make FLAGS="$CPPFLAGS $CXXFLAGS $LDFLAGS"
}

package() {
	install -Dm 755 "$_pkgname/bin/release/iStyle" -t "$pkgdir/usr/bin/"
}
