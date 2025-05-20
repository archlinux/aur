# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-esphome-dashboard
_name=${pkgname#python-esphome-}
pkgver=20250514.0
pkgrel=1
pkgdesc='ESPHome dashboard and ESPHome Web'
arch=(any)
url="https://github.com/esphome/$_name"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools git npm)
source=("git+$url.git#tag=$pkgver")
b2sums=('cfa0500b716a118bf7ffb6738119884383f4e3db907daea84d513a0eb106d780a484134558fb33cd4efbc1f7f2b33176bfcdd762fbe349b133c789467ab440bd')

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
