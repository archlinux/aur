# Maintainer: Lin Ruoshui <lin.ruohshoei@gmail.com>

pkgname=('python-pyfr-git')
_pkgname=('PyFR')
pkgver=0.1.0.r751.g9d4d5e9
pkgrel=1
pkgdesc="Python based framework for solving advection-diffusion type problems on streaming architectures (git version)"
arch=('i686' 'x86_64')
url="http://www.pyfr.org/"
license=('BSD')
conflicts=('python-pyfr')
makedepends=('python-setuptools')
source=("${_pkgname}::git+https://github.com/vincentlab/${_pkgname}.git#branch=develop")
#mpi4py
	#  'python-h5py>=2.6'
depends=( 'python-gimmik>=2.0'
	  'python-h5py-openmpi>=2.6'
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
            
sha256sums=('SKIP')
pkgver() {
	  cd "$_pkgname"
	    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    }
build() {
  msg "Building pyfr"
  cd "$srcdir"/PyFR
  python setup.py build
}

package() {
  cd "$srcdir"/PyFR
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
