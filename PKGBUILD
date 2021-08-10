# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-marshmallow-dataclass"
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=8.5.1
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
sha512sums=('1b9114e778106dee8f8a7e5eecf890ebf09c1ce460ca80fe85ddfb1391f8c0886402ffbf9d096fbc56d845722a15b1c65dbc06c32e8d885349cea618dd48199d')

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
