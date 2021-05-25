# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-bogster-git
_name="${pkgname%-git}"
pkgver=r18.07a082b
pkgrel=1
pkgdesc="A solarized-based theme for Vim and Neovim"
arch=('any')
url="https://github.com/wojciechkepka/bogster"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
optdepends=('vim-airline' 'vim-lightline-git')
provides=("$_name" 'vim-airline-bogster' 'vim-lightline-bogster')
conflicts=("$_name" 'vim-airline-bogster' 'vim-lightline-bogster')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find autoload colors \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
