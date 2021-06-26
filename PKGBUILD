# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: orhun <orhunparmaksiz@gmail.com>

pkgname=faint-git
pkgdesc="Extensible TUI fuzzy file explorer"
pkgver=1.2.0.r6.g84f6fd7
pkgrel=1
arch=('any')
url="https://github.com/salman-abedin/faint"
license=('GPL')
depends=('fzf')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	sed -i 10d Makefile
}

package() {
	cd "$pkgname"
	make DIR_BIN="$pkgdir/usr/bin" install
	install -Dm 644 faintrc -t "$pkgdir/etc/"
	install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
