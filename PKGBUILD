# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-spelunker-git
pkgver=r283.a0bc530
pkgrel=1
pkgdesc="Improved Vim spelling plugin with camel case support"
arch=('any')
url="https://github.com/kamykn/spelunker.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-ctrlp-spelunker')
conflicts=("${pkgname%-git}" 'vim-ctrlp-spelunker')
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find after autoload plugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
