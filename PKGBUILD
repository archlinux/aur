# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=fmf
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.8
pkgrel=1
arch=(any)
license=('GPL2')
pkgdesc='Flexible Metadata Format.'
url='https://github.com/psss/fmf'
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/psss/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a491b7484096b21e1f4ee9f5dc92e19a635a78df94a276bb75c1b8ec9ab252c266fafe58f6fe5fa7d67d0740ae7b68832ba23e66f57c97702be0dc654a871e7b')

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
