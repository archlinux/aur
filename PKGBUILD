# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-inc-dec-git
pkgver=r18.7bfe9c5
pkgrel=1
pkgdesc='Increment and decrement numbers in Kakoune'
arch=(any)
url="https://gitlab.com/Screwtapello/kakoune-inc-dec"
license=(MIT)
depends=(kakoune)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/kakoune-inc-dec"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/kakoune-inc-dec"
	# use American spelling of license
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" inc-dec.kak
	install -Dm644 -t "$pkgdir/usr/share/kak/doc" inc-dec.asciidoc
}
