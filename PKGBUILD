# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>
pkgname=pokego-git
pkgrel=4
pkgver=0.5.2
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/rubiin/pokego.git"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'go' 'coreutils')
conflicts=('pokego')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	go build -ldflags "-s -w" -o pokego
}

package() {
	cd "$pkgname"
	install -Dm755 pokego "$pkgdir/usr/bin/pokego"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Install completions
	install -Dm644 completions/pokego.bash "$pkgdir/usr/share/bash-completion/completions/pokego"
	install -Dm644 completions/pokego.fish "$pkgdir/usr/share/fish/vendor_completions/pokego.fish"
	install -Dm644 completions/pokego.zsh "$pkgdir/usr/share/zsh/site-functions/_pokego"
}
