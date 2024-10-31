# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Previous Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: MCMic <come@chilliet.eu>
_pkgname=pyscroll
pkgname=python-pyscroll
pkgver=2.29
pkgrel=1
pkgdesc="A generic module for making a fast scrolling image with pygame."
arch=('any')
url="https://github.com/bitcraft/pyscroll"
license=(GPL-3.0-only)
depends=(python-pygame)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=($pkgname)
conflicts=($pkgname)
_commit=da826cd81abd48de8929601b07f39d4375b9c33e
source=("git+https://github.com/bitcraft/pyscroll.git#commit=$_commit")
sha256sums=('SKIP')

# implementing https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$srcdir"/$_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd "$srcdir"/$_pkgname
  python -m unittest tests/pyscroll/test_pyscroll.py
}
