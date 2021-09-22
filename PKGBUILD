# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pylightxl
_name=${pkgname#python-}
pkgver=1.57
pkgrel=1
pkgdesc="Minimal functionality Excel library"
arch=('any')
url="https://github.com/PydPiper/pylightxl"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('76185f0955b9d24c936874628b89eeed09d2aef3b56cb52619a4681eb7c1c831e98278f73e348ece1c8f7264794e054f24471bfce7dd8a34eb53132595300826')

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
