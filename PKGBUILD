# Maintainer: Chris Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Tim Langlois <trl54@cornell.edu>

_pkgname=wavefile
pkgname=python-$_pkgname
pkgver=1.6.3
pkgrel=1
arch=(any)
license=(GPL-3.0-or-later)
pkgdesc='Pythonic libsndfile wrapper to read and write audio files'
url='https://github.com/vokimon/python-wavefile'
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-numpy libsndfile)
checkdepends=(python-pytest)
source=("https://pypi.python.org/packages/source/w/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f7c4f7ec62199c7a0a7beeeff9e83c00d40848d85d32d288329b01df07001988')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest --override-ini="addopts="
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -v -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
