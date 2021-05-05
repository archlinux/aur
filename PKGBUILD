# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-symbols-outline-git
pkgver=r70.c9c68de
pkgrel=1
pkgdesc="Neovim tree view plugin for symbols using the Language Server Protocol"
arch=('any')
url="https://github.com/simrat39/symbols-outline.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim-git')
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
  find lua plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
