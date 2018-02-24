# Maintainer: Lin Ruoshui <lin.ruohshoei@gmail.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=('python-pyfr')
pkgver=1.7.5
pkgrel=1
pkgdesc="Python based framework for solving advection-diffusion type problems on streaming architectures"
arch=('i686' 'x86_64')
url="http://www.pyfr.org/"
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/vincentlab/PyFR/archive/v${pkgver}.tar.gz")
#mpi4py
depends=( 'python-gimmik>=2.0'
	  'python-h5py>=2.6'
	  'python-numpy>=1.8'
	  'python-pytools>=2016.2.1'
	  'python-mako>=1.0.0'
	  'python-mpi4py>=2.0')
optdepends=('metis>=5.0: needed for running PyFR in parallel'
	    'scotch>=6.0: needed for running PyFR in parallel'
            'python-pymic: needed for Xeon Phi MIC backend'
	    'python-pycuda>=2015.1: needed for CUDA backend' 
	    'cuda>=4.2: needed for CUDA backend'
            'python-pyopencl: needed for OpenCL backend' 
            'clblas: needed for OpenCL backend' 
            'cblas: needed for OpenMP backend'
            'openblas: alternative blas for OpenMP backend'
	    'cgns>=3.3: for importing CGNS meshes' )
            
sha256sums=('b12dd3ed0cbd3835297dec4f038d1034a2c1cda7100b7c1cee6b4e270cdd132c')

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
