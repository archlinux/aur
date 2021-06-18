# Maintainer: Joel Grunbaum <joelgrun@gmail.com>

_pkgname=traitor
pkgname=traitor-git
pkgver=0.0.6.r2.g3e1a3e3
pkgrel=1
pkgdesc='Automatic Linux privesc via exploitation of low-hanging fruit'
arch=('x86_64')
license=('MIT')
makedepends=('go')
provides=('traitor')
conflicts=('traitor' 'traitor-bin')
url="https://github.com/liamg/$_pkgname"
source=("$_pkgname::git+https://github.com/liamg/traitor.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/traitor"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/traitor"
	make
}

package() {
	cd "$srcdir/traitor"
	install -Dm755 "traitor" "$pkgdir/usr/bin/traitor"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
