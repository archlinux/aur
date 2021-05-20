# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-spaceduck-git
pkgver=r22.0d06e20
pkgrel=1
pkgdesc="An intergalatic space theme for Vim"
arch=('any')
url="https://github.com/pineapplegiant/spaceduck"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-polyglot')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-airline-spaceduck' 'vim-lightline-spaceduck' 'neovim-lualine-spaceduck')
conflicts=("${pkgname%-git}" 'vim-airline-spaceduck' 'vim-lightline-spaceduck' 'neovim-lualine-spaceduck')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"
  find autoload colors lua \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
