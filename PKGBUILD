# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-pears-git
pkgver=r53.a0a5697
pkgrel=1
pkgdesc="Auto pair plugin for Neovim"
arch=('any')
url="https://github.com/steelsojka/pears.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'vim-auto-pairs')
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
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
