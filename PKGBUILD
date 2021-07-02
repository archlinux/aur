# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-lualine-git
pkgver=r214.9726824
pkgrel=2
pkgdesc="A blazing fast and easy to configure neovim statusline plugin"
arch=('any')
url="https://github.com/hoob3rt/lualine.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
# checkdepends=('luacheck')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'vim-airline' 'vim-lightline')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# check() {
#   cd "$pkgname"
#   make check
# }

package() {
  cd "$pkgname"
  find doc lua \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
