# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-fzf-checkout-git
pkgver=r108.aaab59e
pkgrel=1
pkgdesc='Vim plugin for managing branches and tags with fzf'
arch=('any')
url="https://github.com/stsewd/fzf-checkout.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'fzf')
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
  find autoload doc plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
