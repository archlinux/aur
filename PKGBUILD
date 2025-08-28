# Maintainer: <VCalV>

pkgname=vim-lobster-git
pkgver=r7.0bfda4c
pkgrel=1
pkgdesc="Vim support for the Lobster programming language"
arch=('any')
depends=('vim')
makedepends=('git')
url="https://github.com/jcorbin/vim-lobster"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/jcorbin/vim-lobster)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"

  msg 'Installing Vim runtime directories...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"

  # Copy only existing Vim runtime directories
  for _dir in ftdetect ftplugin syntax; do
    [ -d "$_dir" ] && cp -dpr --no-preserve=ownership "$_dir" "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done
}

