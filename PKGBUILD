pkgname=bzr-rewrite
pkgver=0.6.4
pkgrel=1
pkgdesc='Provides a rebase command for bzr similar to git rebase.'
arch=('any')
url='https://launchpad.net/bzr-rewrite'
license=('GPL')
depends=('bzr' 'python2')

source=(bzr+lp:bzr-rewrite)
sha256sums=('SKIP')

prepare() {
  cd bzr-rewrite
  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's,^#!.*/usr/bin/python,#!/usr/bin/python2,g' $file
      sed -i 's,^#!.*/usr/bin/env.*python,#!/usr/bin/env python2,g' $file
  done
}

build() {
  cd bzr-rewrite
  python2 ./setup.py build
}

package() {
  cd bzr-rewrite
  python2 ./setup.py install --root="${pkgdir}"
}
