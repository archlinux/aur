# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-marshmallow-dataclass"
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=8.3.2
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
sha512sums=('97e3706ac46280e259014fb66fb678d711eb2ca8dee745dbbaa7dd5009ad5edf4a8bc73df8ff6f866b8a1966bf3026d4b1aa03ea5a9d56dc47282a5782ea6709')

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
