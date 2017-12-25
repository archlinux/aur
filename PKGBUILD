# Maintainer:Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-meep-bzr
pkgver=1.4.2r25
pkgrel=1
pkgdesc="Python binding for MEEP (FDTD solver by MIT)"
url="https://launchpad.net/python-meep"
arch=('x86_64' 'i686')
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'meep' 'openmpi' 'swig')
makedepends=('bzr')
source=("python2-meep::bzr+https://code.launchpad.net/~python-meep/python-meep/LATEST_RELEASE")
md5sums=('SKIP')

pkgver() {
  cd python2-meep
  _majorver=$(awk '/Meep version/ {print $6}' meep.i)
  printf "%sr%s" "$(echo $_majorver)" "$(bzr revno)"
}

build() {
  cd python2-meep
  tail -n +3 meep-site-init.py.standard > meep-site-init.py
  python2 setup-mpi.py clean --all 
  python2 setup-mpi.py build_ext
}

package() {
  cd python2-meep
  python2 setup-mpi.py install --prefix=/usr --root=${pkgdir}
}
