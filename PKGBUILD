# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=1.2.5
pkgrel=1
pkgdesc="Self-configuring, encrypted and resilient mesh networking stack"
arch=('any')
depends=('python-cryptography' 'python-pyserial')
optdepends=('python-adafruit-nrfutil: for flashing NRF52-based devices')
makedepends=('python-setuptools')
provides=('rnodeconf' 'rnsh')
conflicts=('rnodeconf' 'rnsh')
url="https://reticulum.network/"
license=('MIT')
source=($pkgname-$pkgver::https://github.com/markqvist/Reticulum/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('5f8d51373d08689ccd4bb66136a59459d10f1d518831921ad16bcc6edf2806e4')

build() {
  cd "$srcdir/Reticulum-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/Reticulum-$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find ./docs -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/doc/$pkgname/{}" \;

  python setup.py install --root="$pkgdir" --optimize=1
}
