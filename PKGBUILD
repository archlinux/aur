# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pylightxl
_name=${pkgname#python-}
pkgver=1.56
pkgrel=1
pkgdesc="Minimal functionality Excel library"
arch=('any')
url="https://github.com/PydPiper/pylightxl"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('61ed59e7322f5ee0def53a007d9b44ccd3a68a79b2b2972963b2139f0934b4b18677ac82a8ec37e9e4cfbc983d5f71df115a09843ae3eb01b288734f61abd710')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python setup.py pytest
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
