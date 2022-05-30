# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=vim-hare
pkgver=r45.ad43995
pkgrel=1
pkgdesc='Vim plugins for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare.vim'
license=('custom:vim')
depends=('vim')
makedepends=('git')
_commit='ad43995e5c27bc5a7fdbfc7a5be0909b332e4906'
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
