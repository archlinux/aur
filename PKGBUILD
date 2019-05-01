# Maintainer: Ashwin <ashuwish+arch@gmail.com>

_hgproj=fluiddyn
_hgrepo=fluidsim
_hgver="4c8d09d"
pkgname=python2-fluidsim-hg
pkgver=0.2.2.r901.4c8d09d98df4
pkgrel=1
pkgdesc="FluidDyn project | FluidSim | Simulation package for CFD."
arch=('any')
url="https://bitbucket.org/${_hgproj}/${_hgrepo}"
license=('custom:"CeCILL"')
depends=('python2' 'python2-fluiddyn' 'python2-fluidfft')
optdepends=('fftw-mpi: parallelized solvers'
            'openmpi: parallelized solvers'
            'python2-mpi4py: parallelized solvers')
makedepends=('cython2' 'mercurial' 'python2-setuptools')
provides=(python2-${_hgrepo})

source=("hg+${url}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_hgrepo}"
  hg update ${_hgver}
}

pkgver() {
  cd "${srcdir}/${_hgrepo}"
  echo $(hg parents --template '{word(-1,latesttag,":")}').r$(hg identify -n).$(hg identify -i)
}

build() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py build
}

# check() {
#   cd "${srcdir}/${_hgrepo}"
#   python2 -m unittest discover
# }

package() {
  cd "${srcdir}/${_hgrepo}"
  python2 setup.py install --root=$pkgdir --optimize 1
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
