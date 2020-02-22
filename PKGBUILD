# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-snippets-git
_reponame=kakoune-snippets
pkgver=r62.94931c2
pkgrel=1
pkgdesc='Expand typed text to snippets in Kakoune'
arch=(any)
url="https://github.com/occivink/$_reponame"
license=(custom:unlicense)
depends=('kakoune>=2019.07.01' 'perl')
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
	install -Dm544 -t "$pkgdir/usr/share/$pkgname/rc" snippets*.kak
}
