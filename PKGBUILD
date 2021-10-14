# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Max Gautier <mg+archlinux@max.gautier.name>

pkgname=vim-vsnip-git
pkgver=r304.9ac8044
pkgrel=1
pkgdesc="Snippet plugin for vim that supports LSP/VSCode's snippet format"
arch=('any')
url="https://github.com/hrsh7th/vim-vsnip"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-vsnip-integ: LSP Client support')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=vsnip.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload doc misc plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
