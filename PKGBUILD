# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=17.14.3
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(python-argparse-addons python-humanfriendly python-pyelftools)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
# sdist tarball on pypi.org does not contain all required files: https://github.com/eerimoq/bincopy/issues/33
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('c97580a6805a3d0ec6184c6e97dc0b4b51443cadbb7deb52d69b5b11ba43a0778b993e303f68a20d71959fa3d07ff85078a49fbd4103a5a1ceeb85961c076dab')
b2sums=('3abaa4b5140dfe5944ecf2804c6b1ae75544e819fb258d79b78d049188fdd6584c0f9ecbecb11bd0746748a0a1ab8fcfedb866cd5035ec3b985b2140e298bedb')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
