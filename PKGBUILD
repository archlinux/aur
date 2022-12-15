# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=ibapi
pkgname=python-$_pkgname
pkgver=10.20.01
pkgrel=1
pkgdesc="Python IB API"
arch=("any")
url="https://interactivebrokers.github.io/tws-api"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://interactivebrokers.github.io/downloads/twsapi_macunix.${pkgver/./}.zip"
        "LICENSE")
sha256sums=('f52d9a45066858de4e30330b90592f9b123bf328934052dbcd65f8b74b1832ce'
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
