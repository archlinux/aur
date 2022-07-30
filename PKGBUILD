# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## GPG key: https://github.com/web-flow.gpg

pkgname=neovim-feline-git
pkgver=0.4.1.r50.g2962c8c
pkgrel=1
pkgdesc="Minimal, stylish, and customizable statusline for Neovim"
arch=('any')
url="https://github.com/feline-nvim/feline.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=('neovim-feline')
conflicts=('neovim-feline')
install=feline.install
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') ## GitHub

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find doc lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md USAGE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
