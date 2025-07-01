# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-colorful
_name=${pkgname#python-}
pkgver=0.5.7
pkgrel=1
pkgdesc="Terminal string styling done right, in Python"
arch=('any')
url="https://github.com/timofurrer/colorful"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c5452179b56601c178b03d468a5326cc1fe37d9be81d24d0d6bdab36c4b93ad8')

prepare() {
  cd "$_name-$pkgver"
  sed -i '1,3d' setup.cfg
  sed -i '/License ::/d' setup.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
