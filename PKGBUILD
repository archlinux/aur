# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('python-pyfr')
pkgver=0.3.0
pkgrel=1
pkgdesc="Python based framework for solving advection-diffusion type problems on streaming architectures"
arch=('i686' 'x86_64')
url="http://www.pyfr.org/"
license=('BSD')
makedepends=('python-setuptools')
source=("http://www.pyfr.org/download/PyFR-${pkgver}.zip")
#mpi4py
depends=( 'python-h5py' 'python-numpy' 'python-mpmath' 'python-pytools' 'python-mako' 'python-mpi4py' 'python-appdirs')
optdepends=('metis: needed for running PyFR in parallel'
	    'ptscotch-openmpi: needed for running PyFR in parallel' 
	    'python-pycuda: needed for CUDA Backend' 
            'python-pyopencl: needed for OpenCL Backend' 
            'clblas: needed for OpenCL Backend' 
            'cblas: OpenMP Backend'
            'openblas: Optimized BLAS' )
            
md5sums=('febd0aa2e1a364c2a5e6f26a70a667cf')


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


