# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-colorful
_name=${pkgname#python-}
pkgver=0.5.6
pkgrel=1
pkgdesc="Terminal string styling done right, in Python"
arch=('any')
url="https://github.com/timofurrer/colorful"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b56d5c01db1dac4898308ea889edcb113fbee3e6ec5df4bacffd61d5241b5b8d')

prepare() {
  cd "$_name-$pkgver"
  sed -i '1,3d' setup.cfg
  sed -i 's/value\.s/value.value/' setup.py
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
