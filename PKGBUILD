# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

_pkgname=shorty
pkgname=$_pkgname-git
pkgver=r2.d9e288a
pkgrel=1
pkgdesc="A QML code-screenshot utility."
arch=("i686" "x86_64")
url="https://github.com/qmlbook/shorty.git"
license=("LGPL")
depends=("qt5-base")
makedepends=("git")
provides=("$_pkgname" "$pkgname")
source=("$pkgname::git+https://github.com/qmlbook/$_pkgname")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	qmake
	make
}

package() {
	install -Dm 755 "$srcdir/$pkgname/bin/shorty" "$pkgdir/usr/bin/shorty"
}
