# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-marshmallow-dataclass"
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=8.4.2
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
sha512sums=('23f979148a8eeab6b324ce7ce1e00e46d91867281105ef4f1e14b3fe1f6ff612274e6ee0fb5aa8d19b723f452e7652ddbe07c46db63d1a0f8f67d568b5551194')

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
