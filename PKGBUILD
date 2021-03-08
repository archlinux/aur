# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-auto-pairs-git
pkgver=r116.cac6780
pkgrel=1
pkgdesc='Automatically inserts closing pairs in Kakoune'
arch=(any)
url="https://github.com/alexherbo2/auto-pairs.kak"
license=(Unlicense)
depends=(kakoune kakoune.cr)
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
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/auto-pairs.kak
}
