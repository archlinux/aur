# Maintainer: rafaelff <rafaelff@gnome.org>

_name=pyg3t
pkgname=$_name-git
pkgver=0.4.0.r205.196b47d
pkgrel=1
pkgdesc="Python GetText Translation Toolkit (git)"
arch=(any)
url="https://github.com/pyg3t/pyg3t"
license=('GPL3')
depends=('python2-dateutil')
makedepends=('git')
provides=($_name)
conflicts=($_name)
source=(git+${url}.git)
md5sums=('SKIP')

pkgver() {
  cd pyg3t  
  v=`grep version pyg3t/__init__.py | cut -d\' -f2`
  printf "%s.r%s.%s" "$v" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd pyg3t
  #exit 1
  sed -i "s#!/usr/bin/env python#&2#" \
        pyg3t/gtgrep.py pyg3t/gtparse.py pyg3t/gtxml.py \
        pyg3t/poabc.py  pyg3t/podiff.py  pyg3t/popatch.py

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

