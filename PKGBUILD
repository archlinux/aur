# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(kak-snippets-git kak-snippets-directory-git)
pkgbase=kak-snippets-git
_reponame=kakoune-snippets
pkgver=r62.94931c2
pkgrel=2
pkgdesc='Expand typed text to snippets in Kakoune'
arch=(any)
url="https://github.com/occivink/$_reponame"
license=(Unlicense)
depends=('kakoune>=2019.07.01' 'perl')
makedepends=(git)
provides=("${pkgbase%-git}")
conflicts=("${pkgbase%-git}")
install=$pkgbase.install
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_kak-snippets-git() {
	optdepends=('kak-snippets-directory-git: Define snippets as separate files')
	cd "$srcdir/$_reponame"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgbase" README.md
	install -Dm544 -t "$pkgdir/usr/share/kak/rc/addons" snippets.kak
}

package_kak-snippets-directory-git() {
	depends=('kak-snippets-git')
	pkgdesc='Define kak-snippets as separate files instead of via an option'
	provides=('kak-snippets-directory')
	conflicts=('kak-snippets-directory')
	cd "$srcdir/$_reponame"
	install -Dm544 -t "$pkgdir/usr/share/kak/rc/addons" snippets-directory.kak
}
