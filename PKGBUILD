# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specterext-faucet
pkgver=0.1.2
pkgrel=1
pkgdesc="Specter faucet extention for regtest"
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/stepansnigirev/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9051633e45595a0cac395c9009445807be4be16913730f12d47472ac377afbb6')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py sdist bdist_wheel
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
