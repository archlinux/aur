# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-state-save-git
_reponame=kakoune-state-save
pkgver=r26.ab7c0c7
pkgrel=2
pkgdesc='Save and restore state between sessions in Kakoune'
arch=(any)
url="https://gitlab.com/Screwtapello/$_reponame"
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
	# Use American spelling for license
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" state-save.kak
}
