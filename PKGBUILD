# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=ibapi
pkgname=python-$_pkgname
pkgver=10.11.01
pkgrel=1
pkgdesc="Python IB API"
arch=("any")
url="https://interactivebrokers.github.io/tws-api"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://interactivebrokers.github.io/downloads/twsapi_macunix.${pkgver/./}.zip"
        "LICENSE")
sha256sums=('d565e0a7719db24f7727d01b57adc7c3e9cb3986680f8e04d890c8d4b3b11f7c'
            'c60f3a3fe9a6799a346fe9519b2448334d99a6f0ff3db5c9969493be75941c5d')

build() {
  cd "$srcdir/IBJts/source/pythonclient"
  python setup.py build
}

package() {
  cd "$srcdir/IBJts/source/pythonclient"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm755 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
