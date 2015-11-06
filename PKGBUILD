pkgname=bzr-rewrite
pkgver=0.6.2
pkgrel=1
pkgdesc="Provides a rebase command for bzr similar to git rebase."
arch=('any')
url="https://www.samba.org/~jelmer/bzr-rewrite/"
license=('GPL')
depends=('bzr' 'python2')

source=(http://samba.org/~jelmer/bzr/${pkgname}-${pkgver}.tar.gz)
sha256sums=('90b47caa2dc7c76f3ecdf135b20a0799efe0bb0a304f817f061c46899a71cf06')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's,^#!.*/usr/bin/python,#!/usr/bin/python2,g' $file
      sed -i 's,^#!.*/usr/bin/env.*python,#!/usr/bin/env python2,g' $file
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}"
}
