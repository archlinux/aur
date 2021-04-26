# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=purify-git
pkgname=('vim-purify-git'
         'vim-airline-purify-git'
         'vim-lightline-purify-git'
         'fish-purify-git')
pkgver=r152.f30fb79
pkgrel=1
pkgdesc="A clean & vibrant colorscheme for Vim & other programs"
arch=('any')
url="https://github.com/kyoz/purify"
license=('MIT')
groups=('vim-plugins' 'fish-plugins')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-purify-git()  {
  depends=('vim-plugin-runtime')
  optdepends=('vim-airline-purify'
              'vim-lightline-purify')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase/vim"
  find after colors syntax \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 autoload/purify.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/"
  install -Dvm 644 "$srcdir/$pkgbase/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 "$srcdir/$pkgbase/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-airline-purify-git()  {
  depends=('vim-airline' 'vim-plugin-runtime')
  optdepends=("vim-purify: Base vim theme")
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase/vim"
  install -Dvm 644 autoload/airline/themes/purify.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes"
  install -Dvm 644 "$srcdir/$pkgbase/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 "$srcdir/$pkgbase/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-lightline-purify-git()  {
  depends=('vim-lightline-git' 'vim-plugin-runtime')
  optdepends=('vim-purify: Base vim theme')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase/vim"
  install -Dvm 644 autoload/lightline/colorscheme/purify.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/"
  install -Dvm 644 "$srcdir/$pkgbase/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 "$srcdir/$pkgbase/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_fish-purify-git() {
  depends=('fish')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase/fish"
  install -Dvm 644 purify.fish -t "$pkgdir/etc/fish/conf.d/"
  install -Dvm 644 "$srcdir/$pkgbase/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 "$srcdir/$pkgbase/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
