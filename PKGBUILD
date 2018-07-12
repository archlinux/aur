# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-entrypoints
_pkgname=${pkgname#python2-}
pkgver=0.2.3
pkgrel=1
pkgdesc="Discover and load entry points from installed packages."
arch=('any')
url="https://github.com/takluyver/entrypoints"
license=('MIT')
depends=('python2-configparser')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-setup.py::https://raw.githubusercontent.com/ddboline/entrypoints/master/setup.py")
sha256sums=('a628825648fade6fba8dd94cc26e38340ed840fca3e9d5b7b3dbf755b27bbbdd'
	    '1cf89147d8c8592cb4631c45442c27339f7a071f9a1c5d063edc646a69d10f6a')

prepare() {
  cp "$srcdir"/$pkgname-$pkgver-setup.py "$srcdir"/$_pkgname-$pkgver/setup.py
}

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
