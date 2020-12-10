# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-quickscope-git
_reponame=quickscope.kak
pkgver=r12.2316ef1
pkgrel=1
pkgdesc='plugin that adds indicators to f and t in Kakoune'
arch=(any)
url="https://git.sr.ht/~voroskoi/$_reponame"
license=(Unlicense)
depends=(kakoune 'lua>=5.3')
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_reponame"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons/" quickscope.{kak,lua}
	install -Dm644 -t "$pkgdir/usr/share/kak/doc/" quickscope.asciidoc
}
