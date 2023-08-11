# Maintainer: Yngve Levinsen <first name dot last name at ess dot eu>
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=ess-epics
pkgver=2.0.3
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- ESS flavour"
arch=('any')
url="http://www.aps.anl.gov/epics/"
provides=('epics')
conflicts=('epics')
license=('GPL')
makedepends=('rpcsvc-proto' 'tree' 'git' 'python-build' 'python-installer' 'python-wheel')
depends=('python-gitlab' 'python-yaml' 'python-gitpython')
source=("git+https://gitlab.esss.lu.se/e3/e3.git#tag=${pkgver}")
md5sums=('SKIP')

MAKEFLAGS="-j1" # mutithread building breaks this


build() {
  cd e3
  #bash e3.bash base
  python -m build --wheel --no-isolation
}

package() {
  cd e3
  
  python -m installer --destdir="$pkgdir" dist/*.whl
}
