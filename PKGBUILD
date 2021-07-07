# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-octo-git
pkgver=r480.7f21187
pkgrel=1
pkgdesc="Neovim plugin for editing and reviewing GitHub issues and pull requests"
arch=('any')
url="https://github.com/pwntester/octo.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'github-cli' 'neovim-telescope' 'neovim-web-devicons')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find after lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
