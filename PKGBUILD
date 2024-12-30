# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyoxipng
pkgname=python-${_base}
pkgdesc="Python wrapper for multithreaded .png image file optimizer oxipng"
pkgver=9.1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/nfrasser/${_base}"
license=(MIT)
depends=(python oxipng)
makedepends=(python-build python-installer python-maturin python-wheel)
# checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7a704eb7d2f163d0ae3073d23f2f99641e0708b5fc830a7d0a7e50bfc4fa71e3958dcd46224639f6f0e3eada9ed9537d215b019234b3509857b13851bcae00df')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
