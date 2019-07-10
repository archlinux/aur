# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>

pkgname=vim-hybrid-git
_name=hybrid.vim
pkgver=r46.cc58baa
pkgrel=1
pkgdesc='A dark colour scheme for Vim'
arch=('any')
url="https://github.com/w0ng/vim-hybrid"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
depends=('vim')
provides=('vim-hybrid')
conflicts=('vim-hybrid')
source=("git+https://github.com/w0ng/vim-hybrid.git")
sha256sums=('SKIP')

pkgver() {
  cd vim-hybrid
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  tail -n 28 "vim-hybrid/colors/$_name" | head -n -2 | cut -b2- > LICENSE
}

package() {
  install -Dm644 "vim-hybrid/colors/$_name" \
    "$pkgdir/usr/share/vim/vimfiles/colors/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
