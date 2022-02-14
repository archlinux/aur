# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=ibapi
pkgname=python-$_pkgname
pkgver=10.14.01
pkgrel=1
pkgdesc="Python IB API"
arch=("any")
url="https://interactivebrokers.github.io/tws-api"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://interactivebrokers.github.io/downloads/twsapi_macunix.${pkgver/./}.zip"
        "LICENSE")
sha256sums=('63ba27cc3cafe8fd2208623812c40960725cdedb6ca6aa267faad94735766552'
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
