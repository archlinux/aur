# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-project-git
pkgver=r76.7b23fb7
pkgrel=1
pkgdesc="Project management plugin"
arch=('any')
url="https://github.com/ahmedkhalf/project.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
optdepends=('neovim-telescope: builtin integration')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=project.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
