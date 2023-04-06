# Maintainer: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20230214.0
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'npm')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/$pkgver.tar.gz)
sha256sums=('bdea1aee8ab9e7427f98d941dc2aa73f75e91afe06a302a3f3b3790597a9ec80')

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
