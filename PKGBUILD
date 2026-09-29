# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name=${pkgname#python-}
pkgver=1.5.5
pkgrel=1
pkgdesc="Self-configuring, encrypted and resilient mesh networking stack"
arch=('any')
depends=('python-cryptography' 'python-pyserial')
optdepends=('python-adafruit-nrfutil: for flashing NRF52-based devices'
            'python-bleak: for using the RNode interface over BLE')
makedepends=('python-setuptools')
provides=('rnodeconf' 'rnsh')
conflicts=('rnodeconf' 'rnsh')
url="https://reticulum.network/"
license=('custom:reticulum')
source=(
    $pkgname-$pkgver::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz
    python-rns-license::https://raw.githubusercontent.com/markqvist/Reticulum/refs/heads/master/LICENSE
)
sha256sums=('94f2352c7462e2fcf485d5c770eb2b41e666b753906ac3ce0a94e8a0c489a460'
            '00d736d22a942ba144a5914d05877f0532288024dc189c1aadd1930ee9b4b295')

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$srcdir/python-rns-license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  python setup.py install --root="$pkgdir" --optimize=1
}
