# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-marshmallow-dataclass"
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=8.5.0
pkgrel=1
pkgdesc='Convert dataclasses into marshmallow schemas'
arch=('any')
url='https://github.com/lovasoa/marshmallow_dataclass'
license=('MIT')
# NOTE: python-dataclasses was introduced in Python 3.7, so no longer an explicit dependency.
depends=('python' 'python-marshmallow' 'python-typing_inspect' 'python-marshmallow-enum' 'python-marshmallow-union')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-typeguard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c1f432221e92424fca8f7b76bf55e3b2bc601ca1f835fc6086e2873cb2b2865acc4f82802bf289ad1dadbe701a0abde80e91f9cd23c609381d3ce7c384e13881')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
