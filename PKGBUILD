# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_base="flask"
_pkg="kvsession"
_pipname=Flask-KVSession-fork
_pkgname="${_base}-${_pkg}"
pkgbase="python-${_pkgname}"
pkgname=(
  "python2-${_pkgname}"
  "${pkgbase}"
)
pkgver=0.6.4
pkgrel=1
pkgdesc="Transparent server-side session support for flask"
arch=('any')
url="https://github.com/mbr/${_base}-${_pkg}"
license=('MIT')
makedepends=(
  'python2-setuptools'
  'python-setuptools'
)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/F/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=(
  '709e6a3bcb828fc181e3c26781534ae645409e313db682b7a03b5be1b3fea5c7'
)


prepare() {
    cp -R "${_pipname}-${pkgver}" "python2-${_pipname}-${pkgver}"
}

package_python2-flask-kvsession() {
  depends=('python2')

  cd "python2-${_pipname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${srcdir}/${_pipname}-${pkgver}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-flask-kvsession() {
  depends=('python')

  cd $_pipname-$pkgver 
  python setup.py install --root="${pkgdir}" --optimize=1
  
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "$srcdir/${_pipname}-${pkgver}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}"
}

