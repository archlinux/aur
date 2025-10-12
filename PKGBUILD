# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-esphome-dashboard
_name=${pkgname#python-esphome-}
pkgver=20251009.0
pkgrel=1
pkgdesc='ESPHome dashboard and ESPHome Web'
arch=(any)
url="https://github.com/esphome/$_name"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools git npm)
source=("git+$url.git#tag=$pkgver")
b2sums=('6515e8140586db8aa12a578528217723d16d714ca3ea1c3777f2cd9a4d5942b966e9442b97e539cee15874e6562207211a7b54e3a23c8b93a31618e0172b3e32')

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
