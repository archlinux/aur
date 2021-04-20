# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgbase=vim-falcon-git
pkgname=('vim-falcon-git'
         'vim-airline-falcon-git'
         'vim-lightline-falcon-git'
         'vim-falcon-wallpapers-git')
pkgver=2.1.1.r29.g376aacc
pkgrel=1
pkgdesc="A colorscheme for terminals, Vim and friends"
arch=('any')
url="https://github.com/fenetikm/falcon"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package_vim-falcon-git()  {
  depends=('vim-plugin-runtime')
  optdepends=('vim-airline-falcon: Airline colorscheme'
              'vim-lightline-falcon: Lightline colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find colors lua plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-falcon-git()  {
  depends=('vim-plugin-runtime' 'vim-airline')
  optdepends=('vim-falcon: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/airline/themes/falcon.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/falcon.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-lightline-falcon-git()  {
  depends=('vim-plugin-runtime' 'vim-lightline-git')
  optdepends=('vim-falcon: Base vim colorscheme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  install -Dvm 644 autoload/lightline/colorscheme/falcon.vim "$pkgdir/usr/share/vim/vimfiles/lightline/colorscheme/falcon.vim"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-falcon-wallpapers-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find wallpapers \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}