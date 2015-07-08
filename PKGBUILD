# Maintainer: Connor Behan <connor.behan@gmail.com>
# Submitter: onefire <onefire.myself@gmail.com>
# Contributor: alyst <astukalov@gmail.com>

_pkgbase=julia-vim
pkgname=julia-vim-git
pkgver=r154.e330617
pkgrel=1
pkgdesc="Vim support for the Julia language."
arch=('any')
url="https://github.com/JuliaLang/julia-vim"
depends=('vim')
makedepends=('git')
optdepends=('julia')
provides=('julia-vim')
license=('MIT')
install=vim-julia.install
source=('git://github.com/JuliaLang/julia-vim.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgbase"

  for i in autoload doc ftdetect ftplugin indent syntax
  do
    install -dm 755 "${pkgdir}"/usr/share/vim/vimfiles/$i
    for j in `ls $i/`
    do
      install -m 755 $i/$j "${pkgdir}"/usr/share/vim/vimfiles/$i/$j
    done
  done
}
