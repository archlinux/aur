# Maintainer: Matteo Triggiani <davvore33@gmail.com>
pkgname=('simon-kf5-git')
pkgver=0.5
pkgrel=1
pkgdesc="Simon is an open source speech recognition program that can replace your mouse and keyboard. The system is designed to be as flexible as possible and will work with any language or dialect"
arch=('i686' 'x86_64')
url="https://simon.kde.org/"
license=('GPLv2')
depends=('kdesignerplugin' 'qwt')
makedepends=('cmake' 'git')
optdepends=('pocketsphinx: speech recognition engine'
            'htk: create and modify the speech models'
            'julius: for speech recognition')
conflicts=('simon')
md5sums=('SKIP')

_gitroot='https://github.com/KDE'
_gitname='simon'
_gitbranch='kf5'
source=("$_gitname"::git+"$_gitroot"/"$_gitname".git\#branch="$_gitbranch")


prepare(){
  cd "${srcdir}/${_gitname}"
  mkdir -p build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix`
}

build() {
  cd "${srcdir}/${_gitname}/build"
  make 
  su -c 'make install && ldconfig' 
  kbuildsycoca4
}

package() {
  msg ""
}

# vim:set ts=2 sw=2 et:

