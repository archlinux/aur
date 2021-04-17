# Maintainer: lmartinez-mirror
pkgbase=vim-material-git
pkgname=('vim-material-git'
         'vim-airline-material-git'
         'vim-lightline-material-git')
pkgver=r59.7dfa4bb
pkgrel=1
pkgdesc="Port of the Material colorscheme for Vim/Neovim"
arch=('any')
url="https://github.com/kaicataldo/material.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-material-git()  {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find colors -type f -exec install -Dm 644 '{}' \
    "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-material-git()  {
  depends=('vim-airline')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/airline/themes/material.vim \
    "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/material.vim"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-lightline-material-git() {
  depends=('vim-lightline')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dm 644 autoload/lightline/colorscheme/material_vim.vim \
    "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/material_vim.vim"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
