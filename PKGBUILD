# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=bdflib-git
pkgver=20150305
pkgrel=1
pkgdesc="A Python library for reading, writing and modifying bitmap fonts in BDF format"
#url="http://gitorious.org/bdflib"  #
url="https://github.com/peter-conalgo/bdflib"
# https://gitlab.com/Screwtapello/bdflib maybe?
arch=('any')
license=('GPL2')
depends=('python2')
makedepends=('git')
conflicts=("bdflib")
provides=("bdflib")
#source=('git://gitorious.org/bdflib/mainline.git')
source=('git://github.com/peter-conalgo/bdflib.git')
md5sums=('SKIP')

_gitname="bdflib"

pkgver() {
  cd $_gitname
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd $_gitname

  msg "GIT checkout done or server timeout"
  msg "Starting setup.py..."

  find ./ -type f | xargs -n 1 sed -i 's|/usr/bin/python|/usr/bin/env python2|'
  python2 setup.py build
}

package() {
  cd $_gitname
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

