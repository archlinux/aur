# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-palette-git
_reponame=palette.kak
pkgver=r7.652a00d
pkgrel=1
pkgdesc='Color preview in Kakoune'
arch=(any)
url="https://github.com/alexherbo2/$_reponame"
license=(Unlicense)
depends=(kakoune)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_reponame"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" UNLICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/rc" rc/palette.kak
}
