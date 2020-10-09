# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-smarttab-git
_reponame=smarttab.kak
pkgver=r20.e7fe8ef
pkgrel=1
pkgdesc='Provides commands for three different ways of handling indentation'
arch=(any)
url="https://github.com/andreyorst/$_reponame"
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
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_reponame"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/smarttab*.kak
}
