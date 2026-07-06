# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Joe Zuntz
pkgname=python-twopoint-git
_pkgname=python-twopoint
pkgver=r107.ba68b53
pkgrel=1
pkgdesc="Planning a library for handling files containing 2-point cosmology data"
arch=('any')
url="https://github.com/joezuntz/2point"
license=('GPL')
checkdepends=('make')
depends=('python')
makedepends=('git' 'python' 'python-numpy' 'python-setuptools' 'python-build' 'python-installer')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd "${_pkgname}"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  }
