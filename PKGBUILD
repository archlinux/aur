# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-marshmallow-dataclass"
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=8.3.0
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
sha512sums=('4bddbe77f3131aa40af9b19f1430445c5b285c7912eb43ea09ab64c89a07b4623f2fd62a56747df0c8b418819423f45dcd75bada6b0b4c583d4bb0d68a6657ba')

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
