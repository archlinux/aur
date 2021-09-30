# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-cache
pkgname=python-${_base}
pkgver=1.0
pkgrel=2
pkgdesc="pytest plugin with mechanisms for caching across test runs"
arch=('any')
url="https://pypi.org/project/${_base}"
license=(GPL)
depends=(python-pytest python-execnet)
makedepends=(python-setuptools)
# checkdepends=(python-py)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('55eb66718a45fb0ad8931780d96fa4715cf0d9f2568be2a1b08b3399d391b818a7ae8b2afeb74b50aaf8ec8f7f0d8da8e7a7483845a50e884822ca6ddbca03ea')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="$PWD/tmp_install/$site_packages" py.test
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
