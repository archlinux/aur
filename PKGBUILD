# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Philipp A. <flying-sheep@web.de>
_name=testpath
pkgname=python38-testpath
pkgver=0.6.0
pkgrel=1
pkgdesc='Test utilities for code working with files and commands'
arch=('any')
url="https://pypi.python.org/pypi/testpath"
license=('MIT')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core')
checkdepends=('python38-pytest')
source=("https://pypi.io/packages/source/t/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2f1b97e6442c02681ebe01bd84f531028a7caea1af3825000f52345c30285e0f')

prepare() {
  cd $_name-$pkgver
  rm testpath/cli*.exe
}

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
