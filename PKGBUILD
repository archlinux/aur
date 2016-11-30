# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('python-pyfr')
pkgver=1.5.0
pkgrel=1
pkgdesc="Python based framework for solving advection-diffusion type problems on streaming architectures"
arch=('i686' 'x86_64')
url="http://www.pyfr.org/"
license=('BSD')
makedepends=('python-setuptools')
source=("http://www.pyfr.org/download/PyFR-${pkgver}.zip")
#mpi4py
depends=( 'python-gimmik>=2.0'
	  'python-h5py>=2.6'
	  'python-numpy>=1.8'
	  'python-pytools>2016.2.1'
	  'python-mako>=1.0.0'
	  'python-mpi4py>2.0')

optdepends=('metis: needed for running PyFR in parallel'
	    'ptscotch-openmpi: needed for running PyFR in parallel' 
	    'python-pycuda: needed for CUDA Backend' 
            'python-pyopencl: needed for OpenCL Backend' 
            'clblas: needed for OpenCL Backend' 
            'cblas: OpenMP Backend'
            'openblas: Optimized BLAS' )
            
sha256sums=('84fc65fdcc2e7c446abddbedcf1e44a842593f8a04c3c8927f1c5742266c6333')


build() {
  msg "Building pyfr"
  cd "$srcdir"/PyFR-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/PyFR-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


