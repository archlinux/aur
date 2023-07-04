# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Rafael G. Martins <rafael@rafaelmartins.com>
# Contributor: Iván Pulido <ijpulidos@riseup.net>

_py="python2"
_pkg="mpmath"
pkgname="${_py}-${_pkg}"
pkgver=1.3.0
pkgrel=2
_pkgdesc=('Python library for arbitrary-precision '
          'floating-point arithmetic.')
pkgdesc="${_pkgdesc[*]}"
arch=(
  any
)
url="http://${_pkg}.org"
license=(BSD)
depends=("${_py}-gmpy2")
makedepends=(
  # python-build
  # python-installer
  "${_py}-setuptools"
  "${_py}-wheel"
)
_pypi_url="https://pypi.python.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  '7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f'
)

build() {
  cd "${_pkg}-${pkgver}"
  # "${_py}" -m build --wheel --no-isolation
  "${_py}" setup.py build
}

package() {
  cd "${_pkg}-${pkgver}"
  # "${_py}" -m installer --destdir="$pkgdir" dist/*.whl
  "${_py}" setup.py install --root="${pkgdir}" \
                            --optimize=1

  install -Dm644 LICENSE \
          -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
