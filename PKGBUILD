# Maintainer: bitcoinlizard <bitcoinlizard@fastmail.com>

pkgname=python-embit
pkgver=0.4.0
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
sha256sums=('0d7eb913f5e4e18b1c97e50473b096b9466a2e3791089df6760740b362a0772f')

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
