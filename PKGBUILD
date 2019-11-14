# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Co-maintainer: joffrey <joffrey.darcq@sfr.fr>

_pyname='django-pylibmc'
pkgbase=python-${_pyname}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=0.6.1
pkgrel=2
pkgdesc='Memcached cache backend for Django using pylibmc'
arch=('any')
url="https://github.com/${_pyname}/${_pyname}/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e0c37aaad086e8e9ec987ea35a75107b0375d924c24136e5f56995a916c54b1a')

prepare() {
  cd "${srcdir}"
  cp -a ${_pyname}-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}"/${_pyname}-${pkgver}
  python setup.py build

  cd "${srcdir}"/${_pyname}-${pkgver}-py2
  python2 setup.py build
}

package_python-django-pylibmc() {
  depends=('python-pylibmc>=1.4.1')

  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_pyname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-pylibmc() {
  depends=('python2-pylibmc>=1.4.1')

  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_pyname}-${pkgver}-py2/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
