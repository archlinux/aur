# Maintainer: Lubosz Sarnecki <lubosz at gmail>

pkgname=liblub-git
pkgver=20120913
pkgrel=1
pkgdesc='OpenGL 3 + 4 graphics library with examples.'
arch=('i686' 'x86_64')
url='https://github.com/lubosz/liblub'
license=('GPL3')
depends=('assimp' 'grantlee' 'mesa' 'eject' 'xcb-util-keysyms')
makedepends=('git' 'cmake' 'wget')
provides=('liblub')
conflicts=('liblub')
source=()
md5sums=()

_gitroot="git://github.com/lubosz/liblub.git"
_gitname="liblub"

build() {

  msg "Connecting to github...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
  	cd ${srcdir}/${_gitname}
  	#git clean -dxf
    git pull origin master
    msg "The local files are updated..."
  else
  	cd ${srcdir}
    git clone --depth=1 ${_gitroot}
  fi

  cd ${srcdir}/${_gitname}
  
  msg "Starting cmake for: ${pkgname}"
  #cmake . \
	#	-DCMAKE_INSTALL_PREFIX=/usr
   
   make || return 1
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=$pkgdir install || return 1
}

