# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

_pkg=h5py
pkgbase=python-${_pkg}-git
pkgname=(python-${_pkg}-git python2-${_pkg}-git)
pkgver=r968.3d1edda
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library -- latest commit, with mpi"
url="http://www.h5py.org/"
arch=('x86_64')
license=('BSD')
makedepends=("hdf5-openmpi" 'cython' 'cython2' 'python-numpy' 'python2-numpy' 'python-six' 'python2-six'
             'python-pkgconfig' 'python2-pkgconfig' 'python-mpi4py' 'python2-mpi4py')
provides=(python-${_pkg} python2-${_pkg})
conflics=${provides}

source=("${_pkg}"'::git+https://github.com/h5py/h5py.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${_pkg}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

package_python2-h5py-git() {
  depends=('hdf5-openmpi' 'cython2' 'python2-numpy' 'python2-six' 'python2-pkgconfig' 'python2-mpi4py')
  cd "${_pkg}"
  python2 setup.py configure --mpi
  python2 setup.py install --root="${pkgdir}" --optimize 1
  #install -d644 "${pkgdir}/usr/share/licenses/${pkgname}"
  #install -Dm644 "./licenses/*" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D licenses/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


package_python-h5py-git() {
  depends=('hdf5-openmpi' 'cython' 'python-numpy' 'python-six' 'python-pkgconfig' 'python-mpi4py')
  cd "${_pkg}"
  python2 setup.py configure --mpi
  python setup.py install --root="${pkgdir}" --optimize 1
  #install -d644 "${pkgdir}/usr/share/licenses/${pkgname}"
  #install -Dm644 "./licenses/*" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D licenses/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

