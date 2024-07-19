# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20240620.0
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'npm')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/$pkgver.tar.gz)

build() {
  cd "$srcdir/dashboard-$pkgver"
  npm install --legacy-peer-deps
  script/build
  python setup.py build
}

package() {
  cd "$srcdir/dashboard-$pkgver"

  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('903f58b24edf7d6ae1e87259d6bce1a427fa8b84aaeaf8953b551195ecd88d11')
