# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgbase=python2-macs2
pkgname=('python2-macs2')
_pkgname=MACS2
pkgver=2.1.0.20140616
pkgrel=1
pkgdesc="MACS -- Model-based Analysis of ChIP-Seq"
arch=('i686' 'x86_64')
url="https://github.com/taoliu/MACS/"
license=('Artistic')
depends=('python2-numpy')
source=(https://pypi.python.org/packages/source/M/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('ad105b9ad25bc2eedc78c38d54cf76e8')

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

package_python2-macs2() {
  depends=('python2-numpy')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
