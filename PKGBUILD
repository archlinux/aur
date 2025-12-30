# Maintainer: Jesse R Codling <codling@umich.edu>
pkgname=python-ssqueezepy
_name=${pkgname#python-}
pkgver=0.6.6
pkgrel=1
pkgdesc="Synchrosqueezing, wavelet transforms, and time-frequency analysis in Python"
arch=(any)
url="https://github.com/OverLordGoldDragon/${_name}"
license=(MIT)
depends=(python-numpy python-scipy python-numba)
makedepends=(python-build python-setuptools python-installer python-wheel python-librosa)
# checkdepends=(python-pytest python-pytest-cov python-coveralls python-pyfftw)
optdepends=(
  'python-cupy: for GPU computation'
  'python-pytorch: for GPU computation'
  'python-pyfftw: for maximized FFT speed on CPU'
)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('57bc7f7147ebcfbab3d25afdda8cb42c22a590b2e1a8304c943b0d03b925fe63060152e81013e88219abd51f930f2630e046344eb6a93166b86b94eb2dcda76c')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

# Tests aren't designed to run on build (pop-ups)
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
