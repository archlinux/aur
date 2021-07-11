# Maintainer: bitcoinlizard <bitcoinlizard@fastmail.com>

pkgname=python-embit
pkgver=0.4.4
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
sha256sums=('db5500c9b0daa29eda4f050ca0f0b26f445aa087cdb451e817ac92fe3a0728b5')

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
