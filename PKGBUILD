# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-esphome-dashboard
_name=${pkgname#python-esphome-}
pkgver=20260408.1
pkgrel=1
pkgdesc='ESPHome dashboard and ESPHome Web'
arch=(any)
url="https://github.com/esphome/$_name"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools git npm)
source=("git+$url.git#tag=$pkgver")
b2sums=('4e2654bc5cc7dddf8b54794ea6a5afd331ee6e4837c89476bf1828ab64d2a07f23e63bfd8e9210656bbf6b87c1864190bfcb76805c6aada81de6c279e0c3adff')

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
