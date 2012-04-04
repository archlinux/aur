# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

pkgname=cloudprint-git
pkgver=20120320
pkgrel=1
pkgdesc="Google cloudprint proxy for CUPS - development version"
arch=('any')
url="https://github.com/armooo/cloudprint"
license=('GPL3')
depends=('pycups' 'python2-distribute' 'python2-daemon')
makedepends=('git')
provides=('cloudprint')
conflicts=('cloudprint')

_gitroot="git://github.com/armooo/cloudprint.git"
_gitname="cloudprint"

package() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin master
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  if [[ -e ${srcdir}/${_gitname}-pkg ]]; then rm -rf ${srcdir}/${_gitname}-pkg; fi
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-pkg
  cd ${srcdir}/${_gitname}-pkg

  python2 setup.py install --root=$pkgdir/ --optimize=1 
}
