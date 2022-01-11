# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-hexokinase-git
pkgver=r116.62324b4
pkgrel=1
pkgdesc="Vim plugin for asynchronously displaying hex colors"
arch=('any')
url="https://github.com/rrethy/vim-hexokinase"
license=('unknown')
groups=('vim-plugins')
depends=('hexokinase' 'vim-plugin-runtime')
optdepends=(
	'neovim: virtual text and sign_column support'
	'vim: sign_column support (compiled with +signs)')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload doc lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
}

