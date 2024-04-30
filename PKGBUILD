# Maintainer: Jesse R Codling <codling@umich.edu>
pkgname=python-ssqueezepy
_name=${pkgname#python-}
pkgver=0.6.5
pkgrel=1
pkgdesc="Synchrosqueezing, wavelet transforms, and time-frequency analysis in Python"
arch=(any)
url="https://github.com/OverLordGoldDragon/${_name}"
license=(MIT)
depends=(python-numpy python-scipy python-numba)
makedepends=(python-build python-setuptools python-installer python-wheel)
# checkdepends=(python-pytest python-pytest-cov)
optdepends=(
  'python-cupy: for GPU computation'
  'python-pytorch: for GPU computation'
  'python-pyfftw: for maximized FFT speed on CPU'
)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('3fff67b0174477ee45866eaa8dc67eabf94adb419744290c2fb57a25ec8eeb976d88f34d012ba3159d360cb9f88fb00deccfd27ac6f619c6e9d562bfda326ada')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

# check() {
#   cd ${_name}-${pkgver}
#   python -m pytest tests/
#
# }

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
