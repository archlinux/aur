# Maintainer: Erik Hedlund <erikcghedlund at outlook dot com>
# Contributor: Mill Haruto <mill4134[at]outlook[dot]com>
# This project is adapted from Mill Haruto's
# vim-floatterm-git PKGBUILD: https://aur.archlinux.org/packages/vim-floaterm-git

pkgname=vim-floaterm-with-lf-vim-git
pkgver=r659.r4e28c8d.r112.r80a2ef0
pkgrel=1
pkgdesc='Terminal manager for (neo)vim with the lf.vim plugin added'
arch=('any')
url='https://github.com/voldikss/vim-floaterm'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'lf')
makedepends=('git')
conflicts=('vim-floaterm-git' 'vim-floaterm')
provides=('vim-floaterm' 'vim-lf')
sha256sums=('SKIP' 'SKIP')
_lfvimurl='https://github.com/ptzz/lf.vim'
source=("vim-floaterm-git::git+$url" "vim-lf-git::git+$_lfvimurl")

pkgver() {
  printf "r%s.%s.r%s.%s" "$(cd $pkgname && git rev-list --count HEAD)" "$(cd $pkgname && git rev-parse --short HEAD | sed 's/^/r/')" "$(cd 'vim-lf-git' && git rev-list --count HEAD)" "$(cd 'vim-lf-git' && git rev-parse --short HEAD | sed 's/^/r/')"
}

prepare() {
  mv './vim-lf-git/autoload/floaterm/wrapper/lf.vim' './vim-floaterm-git/autoload/floaterm/wrapper/lf.vim'
  mv './vim-lf-git/plugin/lf.vim' './vim-floaterm-git/plugin/lf.vim'
  mv vim-floaterm-git $pkgname
}

package() {
  cd "$pkgname"
  find autoload bin doc lua plugin -type f \
    -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
