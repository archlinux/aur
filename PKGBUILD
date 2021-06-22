# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=ibapi
pkgname=python-$_pkgname
pkgver=9.85.01
pkgrel=1
pkgdesc="Python IB API"
arch=("any")
url="https://interactivebrokers.github.io/tws-api"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://interactivebrokers.github.io/downloads/twsapi_macunix.${pkgver/./}.zip"
        "LICENSE")
sha256sums=('fcd1bb22aac8e646bc7ba269850bdec72520d7700919d13cd8e7c7663864e6ec'
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
