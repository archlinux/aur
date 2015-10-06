# Old Maintainer: Gero Müller <gero.mueller@physik.rwth-aachen.de>
# Maintainer: Sandro Vitenti <sandro@isoftware.com.br>

pkgname=(python-healpy-git python2-healpy-git)
pkgver=1.8.6.r950.g26997de
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
pkgdesc="Python package to manipulate healpix maps"
depends=('python2-numpy' 'python2-matplotlib' 'python2-pyfits' 'python2' 'cfitsio')
makedepends=()
url="http://healpy.readthedocs.org"
md5sums=('SKIP')
source=('git+https://github.com/healpy/healpy.git')
_gitname=healpy


prepare() {
  cp -a ${_gitname}{,-py2}
}

pkgver() {
  cd $_gitname
  #git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
  echo "$(git describe --abbrev=0 --tags | cut -f 2 -d '-').r$(git rev-list --count HEAD).$(git log -1 --format='g%h')"
}

package_python-healpy-git() {
  depends=('python-numpy' 'python-matplotlib' 'python-pyfits' 'python' 'cfitsio')
  cd $_gitname
  git submodule init
  git submodule update
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}


package_python2-healpy-git() {
  depends=('python2-numpy' 'python2-matplotlib' 'python2-pyfits' 'python2' 'cfitsio')
  cd "${_gitname}-py2"
  git submodule init
  git submodule update
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
