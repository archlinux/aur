# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=vim-hare
pkgver=r41.22e2b66
pkgrel=1
pkgdesc='Vim plugins for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare.vim'
license=('custom:vim')
depends=('vim')
makedepends=('git')
_commit='22e2b66129c6c65025274159dc975d3ca865d57b'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  local _installpath="$pkgdir/usr/share/vim/vimfiles"

  install -vd "$_installpath"

  find \
    . \
    -maxdepth 1 \
    -mindepth 1 \
    ! -path './.git*' \
    ! -type f \
    -exec cp -v -r -t "$_installpath" {} +

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
