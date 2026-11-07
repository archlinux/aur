# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name=${pkgname#python-}
pkgver=1.6.0
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
sha256sums=('aa99d550dacd0c895d81cac6d0740fbd8e89bdb3d452c555a51ef2305a6e5e4d'
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
