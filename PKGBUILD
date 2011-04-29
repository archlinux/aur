# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=cloudprint-git
pkgver=20110429
pkgrel=2
pkgdesc="Google cloudprint proxy for CUPS"
arch=('any')
url="https://github.com/armooo/cloudprint"
license=('GPL3')
depends=('pycups' 'python2-distribute')
makedepends=('git')
optdepends=('python-pip: to "pip install daemon" to run as daemon')
provides=('cloudprint')
conflicts=('cloudprint')

_gitroot="git://github.com/armooo/cloudprint.git"
_gitname="cloudprint"

package() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  python2 setup.py install --root=$pkgdir/ --optimize=1 
}
