# Maintainer: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20210728.0
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'npm')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('6bb1e2f6e55389392cbffdaeaefbf0b8e0c74524ea8e162996a1eee06284e2d3')

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
