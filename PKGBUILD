# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=vim-code-dark-git
pkgname=('vim-code-dark-git'
         'vim-airline-code-dark-git'
         'vim-lightline-code-dark-git')
pkgver=r105.670fed5
pkgrel=1
pkgdesc="A dark colorscheme for Vim inspired by Dark+ in VSCode"
arch=('any')
url="https://github.com/tomasiser/vim-code-dark"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-code-dark-git() {
  depends=('vim-plugin-runtime')
  optdepends=('vim-airline-code-dark'
              'vim-lightline-code-dark')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 colors/codedark.vim -t "$pkgdir/usr/share/vim/vimfiles/colors/"
  install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-code-dark-git() {
  depends=('vim-plugin-runtime' 'vim-airline')
  optdepends=('vim-code-dark')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 {,"$pkgdir/usr/share/vim/vimfiles/"}autoload/airline/themes/codedark.vim
  install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-lightline-code-dark-git() {
  depends=('vim-plugin-runtime' 'vim-lightline-git')
  optdepends=('vim-code-dark')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 {,"$pkgdir/usr/share/vim/vimfiles/"}autoload/lightline/colorscheme/codedark.vim
  install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
