# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=purify-git
pkgname=('vim-purify-git' 'fish-purify-git')
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
  provides=("${pkgname%-git}" 'vim-airline-purify' 'vim-lightline-purify')
  conflicts=("${pkgname%-git}" 'vim-airline-purify' 'vim-lightline-purify')

  cd "$pkgbase/vim"
  find after autoload colors syntax \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
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
