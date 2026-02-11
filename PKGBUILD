# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-esphome-dashboard
_name=${pkgname#python-esphome-}
pkgver=20260210.0
pkgrel=1
pkgdesc='ESPHome dashboard and ESPHome Web'
arch=(any)
url="https://github.com/esphome/$_name"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools git npm)
source=("git+$url.git#tag=$pkgver")
b2sums=('1e0e8248f0915ffb8d3983612001e478387404675063fb03396a71ed0cbd0764772d30b04abd64a62af8966334196c5bfa8919149ffc15c3d7972e3a469a0f95')

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
