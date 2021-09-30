# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Oliver Rümpelein <oli_r@fg4f.de>
# Based upon work of Jeff Parent <jecxjo@sdf.lonestar.org>
_base=pytest-pep8
pkgname=python-${_base}
pkgver=1.0.6
pkgrel=6
pkgdesc="pytest plugin to check PEP8 requirements"
arch=('any')
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-pytest-cache python-pep8) # python-pycodestyle
makedepends=(python-setuptools)
# checkdepends=(python-py)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('162d9e25c264ecd82a51c6798ae75493c724a847ad8cdd953225f73e587f9a14298a6281e541695f6e7471a6121e9b0e4f694270f45ead851e392efcd7aeb758')

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
