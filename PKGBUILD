# Maintainer: Sean Snell <ssnell@lakecs.net>
pkgname=smc-bridge-hrdctl
pkgver=0.3.0
pkgrel=1
pkgdesc="smc-bridge plugin and CLI for Ham Radio Deluxe's native TCP IP Server"
arch=('any')
url="https://github.com/dhtseany/smc-bridge-hrdctl"
license=('GPL-3.0-or-later')
depends=('python')
optdepends=('smc-bridge: control HRD from the SMC-Mixer through the hrdctl plugin')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dhtseany/smc-bridge-hrdctl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('036b1463ba9880297cd58466f03e625802ee8a4effb0bcc0e5cb041370c296e7')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m unittest discover -s tests -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
