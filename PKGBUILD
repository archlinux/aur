#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: csantosb <csantosb dot inventati dot org>

pkgname=python-cocotb-bus
pkgver=0.3.0
pkgrel=1
pkgdesc="Pre-packaged testbenching tools and reusable bus interfaces for cocotb"
arch=('any')
url="https://github.com/cocotb/cocotb-bus/"
license=('BSD-3-Clause')

depends=(
  'python-cocotb'
  'python-scapy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "git+https://github.com/cocotb/cocotb-bus#tag=v${pkgver}"
)
sha256sums=(
  'c8e43d5b019031f5dc21312601864051e96d4290f4aee54609bc132d5ed8eaae'
)

build() {
  cd cocotb-bus
  python -m build --no-isolation --wheel
}

package() {
  cd cocotb-bus
  python -m installer --destdir="$pkgdir" dist/cocotb_bus-"$pkgver"*.whl
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
