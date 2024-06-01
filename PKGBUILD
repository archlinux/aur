# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=python-embit
pkgver=0.8.0
pkgrel=1
pkgdesc="A minimal bitcoin library for MicroPython and Python3 focusing on embedded systems"
arch=('any')
url="https://github.com/diybitcoinhardware/embit"
license=('MIT')
makedepends=('python-setuptools')
depends=('python3')
optdepends=('libsecp256k1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('d16bab65fc1f93e0269d7bff31ec5eed893099aa3fdeb0dbd8e88c49257a6640')

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
