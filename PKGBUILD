# Maintainer: josephgbr <rafael.f.f1@gmail.com>
pkgname=pyg3t-bzr
pkgver=0.3r120
pkgrel=1
pkgdesc="Python GetText Translation Toolkit (bzr)"
arch=(any)
url="https://launchpad.net/pyg3t"
license=('GPL')
depends=('python2')
makedepends=('bzr')
provides=('pyg3t')
conflicts=('pyg3t')
source=('pyg3t::bzr+http://bazaar.launchpad.net/~pyg3t-dev-team/pyg3t/trunk')
md5sums=('SKIP') 

pkgver() {
  cd pyg3t
  
  # get current major and minor (X.Y) version number from source code
  ver=`grep version pyg3t/__init__.py | cut -d\' -f2 | cut -d. -f1-2`

  printf "${ver}r%s" "$(bzr revno)"
}

package() {
  cd pyg3t
  
  sed -i "s#!/usr/bin/env python#&2#" \
        pyg3t/poabc.py pyg3t/podiff.py pyg3t/gtxml.py \
        pyg3t/gtgrep.py pyg3t/gtparse.py pyg3t/popatch.py

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
