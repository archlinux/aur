# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgbase=python-pysmi
_pkgbase="${pkgbase/*-/}"
pkgname=('python-pysmi' 'python2-pysmi')
pkgver=0.2.2
pkgrel=1
pkgdesc="A pure-Python implementation of SNMP/SMI MIB parsing and conversion library. Can produce PySNMP MIB modules."
url="http://snmplabs.com/pysmi/"
arch=('any')
license=('BSD')
makedepends=('python' 'python2')
source=("${_pkgbase}-${pkgver}.tar.gz"::"https://github.com/etingof/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('f46d98c8c9f7ba0ce41c687dc6419c804a9f932c43dcaafbb838c75da7feef52')

package_python-pysmi() {
  depends=('python-ply')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license
  install -D -m 644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}

package_python2-pysmi() {
  depends=('python2-ply')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license
  install -D -m 644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
  # Rename mibdump.py to mibdump2.py
  mv "${pkgdir}/usr/bin/mibdump.py" "${pkgdir}/usr/bin/mibdump2.py"
}
