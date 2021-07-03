# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-compe-git
pkgver=2.0.0.r77.g077329e
pkgrel=2
pkgdesc="Autocompletion plugin for Neovim"
arch=('any')
url="https://github.com/hrsh7th/nvim-compe"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find after autoload doc lua plugin \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
