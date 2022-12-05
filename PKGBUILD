# Maintainer: Gabriel Hansson <gabrielhansson00 at gmail dot com>
pkgname=neovim-ayu-git
pkgver=r90.5af91fe
pkgrel=1
pkgdesc='Lua reimplementation'
arch=('any')
url="https://github.com/Shatur/neovim-ayu"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	find lua/ayu colors -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
}
