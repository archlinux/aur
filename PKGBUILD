# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgbase=python2-macs2
pkgname=('python2-macs2')
_pkgname=MACS2
pkgver=2.1.1.20160309
pkgrel=1
pkgdesc="MACS -- Model-based Analysis of ChIP-Seq"
arch=('i686' 'x86_64')
url="https://github.com/taoliu/MACS/"
license=('Artistic')
depends=('python2-numpy')
source=("https://pypi.io/packages/source/m/macs2/MACS2-${pkgver}.tar.gz")
md5sums=('1cc2fab44b232992060c7ab592bf43fa')

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
