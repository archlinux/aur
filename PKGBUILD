# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mpi4py-fft
pkgname=python-${_base}
pkgver=2.0.5
pkgrel=1
pkgdesc="Parallel Fast Fourier Transforms (FFTs) using MPI for Python"
arch=(x86_64)
url="https://github.com/mpi4py/${_base}"
license=(BSD-2-Clause)
depends=(python-mpi4py python-numpy fftw)
makedepends=(python-build python-installer python-setuptools python-wheel cython0)
optdepends=('python-h5py-openmpi'
  'python-netcdf4-openmpi'
  'python-scipy'
  'python-pyfftw'
  'python-mkl_fft')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('447cbbf9feb468d843f2a8d5e32f2ea44536952c5e53701a6737521e29cca9cfbc1c700954dd2cecf8d8dc9fff4fc4f5cf01a7c8f1939a02e90552a22e77cc0e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
