# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=fzpac-git
_pkgname=fzpac
pkgver=r78.efe4c74
pkgrel=1
pkgdesc="Arch Linux (pacman) package finder with fzf "
arch=("any")
url="https://github.com/sheepla/fzpac"
license=('MIT')
depends=("fzf" "pacman")
optdepends=('bash-completion: completion for bash')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	sed -i -e "s|/local||" Makefile
}

package() {
	cd "$_pkgname"
	export DESTDIR="$pkgdir"
	make install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

