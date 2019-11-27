# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=fmf
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.10
pkgrel=1
arch=(any)
license=('GPL2')
pkgdesc='Flexible Metadata Format.'
url='https://github.com/psss/fmf'
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/psss/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3f59bcb2c188594d5cfd9e5ac9bdd68b08d8f29538f8da741d1ec5f19e19c335f83e2fc50b59a93901a051150e0ee9151348535b63a0f9bd9cc4cde5892a8641')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

package_python-fmf() {
  depends=('python-pyaml')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-fmf() {
  depends=('python2-pyaml')
  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
