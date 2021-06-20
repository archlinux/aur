# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pylightxl
_name=${pkgname#python-}
pkgver=1.55
pkgrel=1
pkgdesc="Minimal functionality Excel library"
arch=('any')
url="https://github.com/PydPiper/pylightxl"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6d00ad1a62f5c781b38c0c0f94e3503a51a3a7143db953e1da09544c06facfefb552349b9f940632ea6620535d8588683a94e211d6c56a9b842658ff302e85a3')

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
