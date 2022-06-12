# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname='python2-chardet'
_name="${pkgname#python2-}"
pkgver=4.0.0
pkgrel=2
pkgdesc='Python 2 module for character encoding auto-detection'
arch=('any')
url="https://pypi.org/project/${_name}/"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
# checkdepends=('python2-pytest')
_tarname="${_name}-${pkgver}"
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('6a4c49441a9f21215a752fad970820f623f406695ad30518ac2acd423ed1e467cedbcf743fe63e54ce384d426f62aa2f6b0013b086c3efaba28d8d8f976befc9')

prepare() {
  cd "${_tarname}"
  sed -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python$|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
   cd "${_tarname}"
   python2 setup.py build
}

# check() {
#    cd "${_tarname}"
#    python2 -m pytest
# }

package() {
   cd "${_tarname}"
   python2 setup.py install --root="${pkgdir}" --optimize=1

   # To avoid file conflict with the python3 version
   mv "${pkgdir}/usr/bin/chardetect"{,-py2}
}
