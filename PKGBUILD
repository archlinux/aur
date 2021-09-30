# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pykry
pkgname=python-${_base}
pkgdesc="Thin wrapper around KryPy (Krylov subspace package)"
pkgver=0.1.5
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-krypy)
makedepends=(python-setuptools)
# checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('55488bf0f3914656696e2fe08445d95617bb96a52e9dbca179da2ae6d431153999e1165fbee7a057d39f5e8ccf07ad701572d0cbdcad758ba786add062de0889')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
