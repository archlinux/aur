# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python2-ezdxf
_pkgname=ezdxf
pkgver=0.6.5
pkgrel=1
pkgdesc="A Python package to create/manipulate DXF drawings."
arch=('i686' 'x86_64')
url="http://bitbucket.org/mozman/ezdxf"
license=('MIT')
depends=('python2')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('bd471bd7d433e085b8f6d11ab39055b2')

prepare() {
  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
  # change python to python2
  find "${_pkgname}-${pkgver}-py2" -name '*.py' -type f -exec \
      sed -i 's|env python|env python2|' {} \;
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
