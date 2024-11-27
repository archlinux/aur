# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Previous Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: MCMic <come@chilliet.eu>
_pkgname=pyscroll
pkgname=python-pyscroll
pkgver=2.31
pkgrel=1
pkgdesc="A generic module for making a fast scrolling image with pygame."
arch=('any')
url="https://pypi.org/project/pyscroll/#files"
license=(GPL-3.0-only)
depends=('python' 'python-pygame')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=($pkgname)
conflicts=("$pkgname" "python-pyscroll-git")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('0c16ea6a512fdd6d242b95cde67760662c48308235cee95847e6b4f2cb6daf2b0c1317db33b34741d040827f9bc0156d147d76d4c0d7d9929e3df630e6816c61')

# implementing https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
