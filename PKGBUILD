# Maintainer: Piroro-hs
# Contributor: Ben Aaron Golberg <ben@benaaron.dev>

pkgname=geticons-git
pkgver=1.2.2.r0.ga45ffdc
pkgrel=2
pkgdesc="CLI tool to get icons on Linux and other Freedesktop systems"
arch=('x86_64')
makedepends=('cargo' 'git' 'scdoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://git.sr.ht/~zethra/geticons"
license=('GPL')
source=("$pkgname::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 geticons "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 geticons.1 "$pkgdir/usr/share/man/man1/${pkgname%-git}.1"
}
