# Maintainer: Sean Snell <ssnell@lakecs.net>
pkgname=smc-bridge-hrdctl
pkgver=0.4.0
pkgrel=2
pkgdesc="smc-bridge plugin and CLI for Ham Radio Deluxe's native TCP IP Server"
arch=('any')
url="https://github.com/dhtseany/smc-bridge-hrdctl"
license=('GPL-3.0-or-later')
depends=('python')
optdepends=('smc-bridge: control HRD from the SMC-Mixer through the hrdctl plugin')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dhtseany/smc-bridge-hrdctl/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8e0ff9f6cefd8ed28de12d709bbf2a58e8633372f273a7a1ab02ee77b69a4c340a8d15508244e9eb09356be1e1bc1d4037b8892a54d530570a26c2bb7b5013e1')

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
