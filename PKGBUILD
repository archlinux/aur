# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: lmartinez-mirror
pkgbase=vim-autoformat-git
pkgname=('vim-autoformat-git' 'neovim-autoformat-git')
pkgver=r548.7b35295
pkgrel=2
pkgdesc="Provides easy code formatting by integrating existing formatters"
arch=('any')
url="https://github.com/chiel92/vim-autoformat"
license=('MIT')
groups=('vim-plugins' 'neovim-plugins')
makedepends=('git' 'neovim' 'python-pynvim' 'vim')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-autoformat-git()  {
  depends=('vim')
  provides=("${pkgbase%-git}")
  conflicts=("${pkgbase%-git}")

  cd "$pkgbase"
  find plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-autoformat-git() {
  depends=('neovim' 'python-pynvim')
  provides=("${pkgbase%-git}")
  conflicts=("${pkgbase%-git}")

  cd "$pkgbase"
  find plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
