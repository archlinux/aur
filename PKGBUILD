# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-colorful
_name=${pkgname#python-}
pkgver=0.5.8
pkgrel=1
pkgdesc="Terminal string styling done right, in Python"
arch=('any')
url="https://github.com/timofurrer/colorful"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bb16502b198be2f1c42ba3c52c703d5f651d826076817185f0294c1a549a7445')

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
