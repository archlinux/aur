# Maintainer: lmartinez-mirror
pkgname=vim-matchup-git
pkgver=0.6.0.r24.g5a51894
pkgrel=1
pkgdesc="A modern drop-in replacement for matchit.vim and matchparen"
arch=('any')
url="https://github.com/andymass/vim-matchup"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('neovim-matchup-opt-git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find after autoload doc lua plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
