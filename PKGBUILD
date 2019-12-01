# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=('python-pyld' 'python2-pyld')
_pkgname='pyld'
pkgver=1.0.5
pkgrel=2
pkgdesc="An implementation of the JSON-LD specification in Python"
arch=('any')
url="https://github.com/digitalbazaar/pyld"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://github.com/digitalbazaar/${_pkgname}/archive/${pkgver}.tar.gz
        0001-Fixed-remote-frame-context-handling.patch)
sha512sums=('a673d953be990fde98a3b32e879e1b7941afc9d3082be6400f69223deee226047e05b0ce68bdf05844cb7e8e3142f731f7c4891b6a4986413518dbdaa2da779c'
            'd0b15814c2fe315ad3dddda8ea452229a172be060d7074b6d99ec9eaed857f2e6b715e760cbcc194f9c8a679bc929ac652df847377c6e8b4944bf77795432f19')

prepare() {
  patch -p1 -d "${srcdir}/${_pkgname}-${pkgver}" < "${srcdir}"/0001-Fixed-remote-frame-context-handling.patch

  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-pyld() {
  depends=('python-setuptools')

  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="${pkgdir}" -O1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pyld() {
  depends=('python2-setuptools')

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"

  python2 setup.py install --root="${pkgdir}" -O1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
