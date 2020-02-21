# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-auto-pairs-git
pkgver=r104.11fbd7c
pkgrel=1
pkgdesc='Automatically inserts closing pairs in Kakoune'
arch=(any)
url="https://github.com/alexherbo2/auto-pairs.kak"
license=(custom:unlicense)
depends=(kakoune)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/auto-pairs.kak"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/auto-pairs.kak"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" UNLICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/rc" rc/auto-pairs.kak
}
