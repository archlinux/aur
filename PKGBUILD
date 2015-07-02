# Contributor: 3ED <krzysztof1987__at__gmail__dot__com>

pkgname=pydefrag-bzr
_bzrmod=pfbh
pkgver=122
pkgrel=4
pkgdesc="The defragmenter is written using a simple combination of filefrag (a readily available fragmentation checker for Linux) and atomic copy. Inspired by Gentoo's fragcheck.pl and Con Kolivas's defrag script. (pfbh branch)"
arch=('any')
url="https://code.launchpad.net/~brywilharris/pyfragtools/pfbh"
license=('GPL')
makedepends=('bzr')
depends=('python2' 'rsync')
optdepends=("psyco27-svn: JIT compiler for Python 2.7 (development version)")
source=("bzr+http://bazaar.launchpad.net/~brywilharris/pyfragtools/pfbh/")
md5sums=('SKIP')

pkgver() {
  cd $_bzrmod
  bzr revno
}

prepare() {
  cd $_bzrmod

  # in that way because this is bzr... :[
  if head -n1 pydefrag|grep -q 'python$'; then
    sed 's:python$:python2:' -i pydefrag
  fi
}

check() {
  cd $_bzrmod

  echo TEST: died here or script interpreter is correctly set to python2..
  head -n1 pydefrag|grep -q 'python2$'
}

package() {
  cd $_bzrmod
  install -dm755 "${pkgdir}"/usr/bin
  install -m 755 pydefrag "${pkgdir}"/usr/bin/pydefrag
}
