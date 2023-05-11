# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=pgzero
pkgname=python-$_name
pkgver=1.2.1
pkgrel=2
pkgdesc='A zero-boilerplate 2D games framework'
url='https://pypi.org/project/pgzero/'
license=(GPL)
arch=(any)
depends=(python-numpy python-pygame)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8cadc020f028cbac3e0cbd3bb9311a1c045f1deedac7917ff433f986c38e6106')

prepare() {
  cd $_name-$pkgver
  sed -i -e "s|pygame[^']*|pygame|" setup.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
