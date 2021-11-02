# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-matchup-git
pkgver=0.6.0.r162.g42c91ec
pkgrel=1
pkgdesc="A modern drop-in replacement for matchit.vim and matchparen"
arch=('any')
url="https://github.com/andymass/vim-matchup"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('neovim-tree-sitter: builtin tree-sitter integration')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('neovim-matchup-opt-git')
install=matchup-treesitter.install
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('168D178A91F74875F03072A61673F578F47AE612') ## Andy Massimino

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find after autoload doc lua plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
