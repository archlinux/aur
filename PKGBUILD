# Maintainer:  Polichronucci <nick at discloud dot eu>

pkgname=vim-neomutt-git
pkgver=r9.b224ff5
pkgrel=1
pkgdesc='Vim syntax for neomutt.'
arch=('any')
url='https://github.com/neomutt/neomutt.vim'
license=('GPL2')
depends=('neomutt' 'vim')
makedepends=('git')
source=("${pkgname}"::"git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"

  local _vimfiles="$pkgdir/usr/share/vim/vimfiles"
  for dir in */
  do
    for file in ${dir}*
    do
      install -Dm644 "${file}" "$_vimfiles/${file}"
    done
  done
}
