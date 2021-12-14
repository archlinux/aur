# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=blaze
pkgname=python-${_base}
pkgver=0.11.3
pkgrel=2
pkgdesc="NumPy and Pandas interface to Big Data"
arch=('any')
url="https://github.com/${_base}/${_base}"
license=('custom')
depends=(python-flask-cors python-odo python-psutil python-sqlalchemy python-toolz)
makedepends=(python-setuptools) # python-numpydoc
# checkdepends=(python-pytest python-py4j)
optdepends=('python-pymongo: MongoDB support'
  'python-h5py: HDF5 support')
source=(${_base}-${pkgver}::${url}/archive/${pkgver}.tar.gz)
sha512sums=('030079e5d3f17355dac588154ffb7ba7993935dfd39bce141341b6e2b9a17f812982ce83776ac1e4224649a343b58615621347ba65e5aba2ca2e568d755f276f')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
