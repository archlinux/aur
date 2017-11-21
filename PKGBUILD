# Maintainer:Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python2-meep-bzr
pkgver=1.4.2.25
pkgrel=1
pkgdesc="Python binding for MEEP (FDTD solver by MIT)"
url="https://launchpad.net/python-meep"
arch=('x86_64' 'i686')
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib' 'meep' 'openmpi' 'swig')
makedepends=('bzr')
source=("bzr+https+urllib://code.launchpad.net/python-meep")
md5sums=('SKIP')

pkgver() {
  cd python-meep
  printf "1.4.2.%s" "$(bzr revno)"
}

build() {
  cd python-meep
  tail -n +3 meep-site-init.py.standard > meep-site-init.py
  python2 setup-mpi.py clean --all 
  python2 setup-mpi.py build_ext
}

package() {
  cd python-meep
  python2 setup-mpi.py install --prefix=/usr --root=${pkgdir}
}

