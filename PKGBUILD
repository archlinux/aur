# Maintainer: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20211015.0
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'npm')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('3eeb74612cc45ad9deee00a0fab8c08bd1621c204523d74b21042f17d0378f51')

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
