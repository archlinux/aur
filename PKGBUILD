# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name=${pkgname#python-}
pkgver=1.5.2
pkgrel=2
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
    https://raw.githubusercontent.com/markqvist/Reticulum/refs/heads/master/LICENSE
)
sha256sums=(
    'a7f8f0d445312fee1c4ade41178f5224fe7af8bd790a79d148696659d81cc862'
    '00d736d22a942ba144a5914d05877f0532288024dc189c1aadd1930ee9b4b295'
)

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  python setup.py install --root="$pkgdir" --optimize=1
}
