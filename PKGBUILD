# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-dotty-dict
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=1.3.0
pkgrel=2
pkgdesc="Dictionary wrapper for quick access to deeply nested keys"
arch=('any')
url="https://github.com/pawelzny/dotty_dict"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('2552ca6578e92c0de8284bc74fe81425fa4f814aa8247531a9d5ed80f3a8e738d2acb3a0cafeffc14a99a67788e2d97b685b5221caff47b012f377a1afdf4644')

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
