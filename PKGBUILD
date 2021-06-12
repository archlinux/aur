# Maintainer: bitcoinlizard <bitcoinlizard@fastmail.com>

pkgname=python-embit-git
pkgver=r101.249bd2a
pkgrel=1
pkgdesc="A minimal bitcoin library for MicroPython and Python3 with a focus on embedded systems."
arch=('any')
url="https://github.com/diybitcoinhardware/embit"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
optdepends=('libsecp256k1')
provides=('python-embit')
conficts=('python-embit')
source=("git+https://github.com/diybitcoinhardware/embit")
sha256sums=('SKIP')

pkgver() {
  cd "embit"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "embit"
}

build() {
  cd "embit"
  python setup.py build
}

package() {
  cd "embit"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/embit/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
