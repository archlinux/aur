# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mpi4py-fft
pkgname=python-${_base}
pkgver=2.0.6
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
  'python-mkl-fft')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('6ad806d5b18463efd6f113e6135e8d0dff4f4686899127ce1f03bd2fa3f24eb5d628657ff6261e5df023fda63aca4cb883b90ec376829dc474bc487b27835f2b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
