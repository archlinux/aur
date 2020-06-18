# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-surround-git
_reponame=kakoune-surround
pkgver=r21.efe74c6
pkgrel=2
pkgdesc='Provides commands to add, change, and delete surrounder in Kakoune'
arch=(any)
url="https://github.com/h-youhei/$_reponame"
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
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" surround.kak
}
