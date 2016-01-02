# Maintainer: Ashwin <ashuwish+arch@gmail.com>

pkgname=python2-fluidsim-hg
pkgver=0.0.3a
pkgrel=1
pkgdesc="FluidDyn project | FluidSim | Simulation package for CFD."
_hgproj=fluiddyn
_hgrepo=fluidsim
arch=('any')
url="https://bitbucket.org/${_hgproj}/${_hgrepo}"
license=('custom:"CeCILL-B"')
depends=('python2>=2.7.3' 'python2-numpy' 'python2-psutil' 'python2-h5py'
	 'python2-matplotlib' 'python2-ptyprocess' 'python2-fluiddyn-hg' 'fftw')
makedepends=('cython2' 'mercurial' 'python2-setuptools')
optdepends=('fftw-mpich: parallelized solvers'
            'mpich: parallelized solvers'
            'python2-mpi4py=1.3.1: parallelized solvers')
provides=('fluidsim')

source=("hg+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_hgrepo}/${_hgrepo}"
  python2 -c "from _version import __version__; print __version__"
}

pkgrel() {
  cd "${srcdir}/${_hgrepo}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
