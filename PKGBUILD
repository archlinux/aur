# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-esphome-dashboard
_name=${pkgname#python-esphome-}
pkgver=20250814.0
pkgrel=1
pkgdesc='ESPHome dashboard and ESPHome Web'
arch=(any)
url="https://github.com/esphome/$_name"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools git npm)
source=("git+$url.git#tag=$pkgver")
b2sums=('b794168dee0754c5112d960522995ed2d550f06b0a15a1173e89e01be9edc60baf17303ebdeb1c2db259584466b200a5cffd9ad8ecfb13138321f50fce762ec5')

build() {
  cd $_name
  npm ci
  ./script/build
  python -m build --wheel --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
