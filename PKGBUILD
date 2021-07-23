# Maintainer: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20210719.0
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'npm')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('de56e9c3cf5ea200a1c5462d685b5caf4b51a14cb434562d5f279d80a88c42ab')

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
