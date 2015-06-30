# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com
 
pkgname=python2-opensubtitles-git
pkgver=20131117
pkgrel=1
pkgdesc="wrapper to the common methods at OpenSubtitles.org"
url="https://github.com/agonzalezro/python-opensubtitles"
arch=('any')
license=('BSD')
install=''
source=()
depends=('python2' 'python2-setuptools')
optdepends=()
conflicts=()
provides=''
makedepends=()

_gitname="python-opensubtitles"
_gitroot="https://github.com/agonzalezro/${_gitname}.git"
 
 
build() {
  cd $srcdir
  msg "Connecting to GIT (${_gitroot}) ..."
 
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone $_gitroot $_gitname
  fi
 
  msg "GIT checkout done or server timeout"
 
  cd $srcdir/${_gitname}/
  python2 setup.py build
}
 
package() {
    cd $srcdir/${_gitname}
    python2 setup.py install -f --root="$pkgdir"
}
