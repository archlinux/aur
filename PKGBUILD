# Maintainer: bitcoinlizard <bitcoinlizard@fastmail.com>

pkgname=python-embit
pkgver=0.4.2
pkgrel=1
pkgdesc="A minimal bitcoin library for MicroPython and Python3 with a focus on embedded systems."
arch=('any')
url="https://github.com/diybitcoinhardware/embit"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
conflicts=('python-embit-git')
optdepends=('libsecp256k1')
provides=('python-embit')
source=("https://github.com/diybitcoinhardware/embit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74687fb3ca8c05b2c14fbb43418573b085caa8d36c7fb45432eca86a1a5647c3')

prepare() {
  cd "embit-${pkgver}"
}

build() {
  cd "embit-${pkgver}"
  python setup.py build
}

package() {
  cd "embit-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/"embit-${pkgver}"/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
