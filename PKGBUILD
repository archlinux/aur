# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Marc Cousin (Marco44) <cousinmarc@gmail.com>

pkgname=imposm-parser-git
pkgver=20131009
pkgrel=1
pkgdesc="Python Lib for Open Street Map files parsing"
url="https://github.com/omniscale/imposm-parser"
arch=('any')
license=('APL2.0')
depends=('python2')
makedepends=('git' 'protobuf' 'python2-protobuf')
_gitroot='git://github.com/omniscale/imposm-parser.git'
_gitname='imposm-parser'
_gitnumber='1.0'

build() {
  cd ${srcdir}

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are up-to-date now."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
}

package()
{
  cd ${srcdir}/$_gitname-build
  python2 setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
}
