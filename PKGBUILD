# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-prelude-git
_reponame=prelude.kak
pkgver=r1.05b2642
pkgrel=1
pkgdesc='Prelude of shell blocks for Kakoune'
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
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/*
}
