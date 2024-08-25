#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: csantosb <csantosb dot inventati dot org>

pkgname=python-cocotb-bus
pkgver=0.2.1
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
  'b627b536aaa2150a682869c22d8ea29588191856812adaad00e617a67f3c23cd'
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
