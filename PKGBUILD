# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=python-embit
pkgver=0.4.13
pkgrel=1
pkgdesc="A minimal bitcoin library for MicroPython and Python3 focusing on embedded systems"
arch=('any')
url="https://github.com/diybitcoinhardware/embit"
license=('MIT')
makedepends=('python-setuptools')
depends=('python3')
optdepends=('libsecp256k1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('3384412e3ab3d0f3ceaf5dc4ecd7cb184f5fadc36d07cd469b7e5eaaccd2b978')

prepare() {
  cd "embit-${pkgver}"
  sed -i '/package_data/d' setup.py
}

build() {
  cd "embit-${pkgver}"
  python setup.py build
}

package() {
  cd "embit-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license since the package doesn't include it
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
