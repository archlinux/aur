# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pylightxl
_name=${pkgname#python-}
pkgver=1.58
pkgrel=1
pkgdesc="Minimal functionality Excel library"
arch=('any')
url="https://github.com/PydPiper/pylightxl"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d0ae490fa517dd582e06139725240348ef97dce2d9688570f5b827350a0e6f826bdadec888bb402456cab55ac1cee522e62d05fc87188eace5549bcfc834b7b5')
b2sums=('97a8f1bc96a0efe46d2d35822ad09057f65a108c4c0a6f8f4beb5c30fc4bb349f77788aaed93220425da6a1dd63045eb2ae3d497f9e4dd8af4ee76a9852de625')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
