# Maintainer: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20211211.0
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'npm')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/$pkgver.tar.gz)
sha256sums=('6c5b3477e5d7b786df7f88b96f6ec5aad9a7596607658a0248a352e21f3da7b9')

build() {
  cd "$srcdir/dashboard-$pkgver"
  npm ci
  script/build
  python setup.py build
}

package() {
  cd "$srcdir/dashboard-$pkgver"

  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
