# Maintainer: LinRs <LinRs@users.noreply.github.com>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=('python-pyfr')
_pkgname=PyFR
pkgver=1.9.0
pkgrel=1
pkgdesc="Python based framework for solving advection-diffusion type problems on streaming architectures"
arch=('i686' 'x86_64')
url="http://www.pyfr.org/"
license=('BSD')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz":"https://github.com/PyFR/PyFR/archive/v${pkgver}.tar.gz")
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

sha256sums=('a99d9dfbe3f8a9ba057e881b1b4d5dd7119235485d7a043381b93334bfb5ab66')

build() {
  msg "Building pyfr"
  cd "$srcdir"/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
