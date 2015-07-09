# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=scanmem-git
_gitname=scanmem
pkgver=v0.15.2
pkgrel=1
pkgdesc="A utility used to locate the address of a variable in an executing process."
arch=('i686' 'x86_64')
url="https://github.com/coolwan/scanmem"
provides=('scanmem')
conflicts=('scanmem')
license=('GPL3')
depends=('python' 'pygtk' 'polkit' 'python-gobject')
makedepends=('intltool')
#optdepends=('gksu: needed for the GameConqueror GUI.')
source=("git+https://github.com/scanmem/scanmem.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  
  ./autogen.sh
  ./configure --enable-gui --prefix=/usr
  msg2 "Building..."
  make -s
}

package() {
  cd $_gitname
  make -s DESTDIR="$pkgdir" install

  # Replacing calls to the Python 3.x interpreter to the Python 2.x one:
  #sed 's|python|python2|g' -i "$pkgdir/usr/bin/gameconqueror"
  #sed 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' -i \
  #  "$pkgdir/usr/share/gameconqueror/"{backend.py,GameConqueror.py,hexview.py}
}

