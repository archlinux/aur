# Maintainer:  kirill9617 <kirill9627@yandex.ru>

pkgname=vim_lib
pkgver=97.367812f
pkgrel=1
pkgdesc="Base library for vim plygins by Delphinium"
arch=('any')
url='https://github.com/Bashka/vim_lib'
license=('')
depends=('vim')
makedepends=('git')
install='vim_lib.install'
source=("$pkgname::git+git://github.com/Bashka/vim_lib.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  mkdir -p "${pkgdir}/usr/share/vim/bundle/vim_lib"

  echo "filetype off" > vimrc
  echo "set rtp=/usr/share/vim/bundle/vim_lib" >> vimrc
  echo "call vim_lib#sys#Autoload#init('/usr/share/vim','bundle')" >> vimrc
  echo "Plugin 'vim_lib'" >> vimrc
  echo "\" Add plugins here" >> vimrc
  echo "filetype indent plugin on" >> vimrc

  # We don't need anything related to git in the package.
  rm -rf .git*

  # Copy everything else.
  cp -r . "${pkgdir}/usr/share/vim/bundle/vim_lib"
}

# vim:set ts=2 sw=2 et:
