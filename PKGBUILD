# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-liblarch-git
pkgver=v0.1.r90.g0e5ff7e
pkgrel=1
pkgdesc="Python library to easily handle data structure, with a GTK binding"
arch=('any')
url="https://live.gnome.org/liblarch"
license=('LGPL3')
depends=('python2')
optdepends=()
makedepends=('git' 'python2' 'python2-distribute')
checkdepends=('python2-nose')
provides=('python2-liblarch')
conflicts=('python2-liblarch')
source=("git://github.com/liblarch/liblarch.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/liblarch"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/liblarch"
  python2 run-tests
}

build() {

  cd "$srcdir/liblarch"
  python2 setup.py build
}

package() {
  cd "$srcdir/liblarch"
  python2 setup.py install --root="${pkgdir}"
  find "${pkgdir}"/usr/lib/python2.7/site-packages/liblarch -name '*.py' | \
  xargs sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"

  find "${pkgdir}"/usr/lib/python2.7/site-packages/liblarch_gtk -name '*.py' | \
  xargs sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"
}

# vim:set ts=2 sw=2 et:
