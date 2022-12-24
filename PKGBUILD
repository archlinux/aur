# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specterext-liquidissuer
pkgver=0.2.3
pkgrel=1
pkgdesc="Issue Liquid assets with specter-desktop"
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-embit' 'python-flask')
source=("https://github.com/cryptoadvance/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('d6826b66686ec5f1814d8cb1d84a7a4ce9fda98ad4b96d51da776cda0272fbb5')

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
