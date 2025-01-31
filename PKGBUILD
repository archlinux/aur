# Maintainer: dringsim <dringsim@qq.com>

_pkgname=vim-repl
pkgname=vim-repl-sillybun-git
pkgver=r401.8e0fa9b
pkgrel=1
pkgdesc="Best REPL environment for Vim"
arch=('any')
depends=('vim' 'perl' 'python')
makedepends=('git')
url="https://github.com/fidian/hexmode"
license=('GPL-2.0-or-later')
source=(${_pkgname}::git+https://github.com/sillybun/vim-repl)
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}

  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload ftplugin plugin pythonx; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

