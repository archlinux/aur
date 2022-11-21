# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pastedeploy
pkgver=3.0.1
pkgrel=1
pkgdesc="Load, configure, and compose WSGI applications and servers"
arch=('any')
license=('MIT')
url="http://pythonpaste.org/deploy/"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pylons/pastedeploy/archive/$pkgver.tar.gz")
sha512sums=('2b06351b9104da1e0d30c90492ee31113aacf5cde7a66a34482c4625af902b855eab2af80073db4eb18805a192f858dac360062dadf58a161cc3cfabf5b67a1a')

prepare() {
  cd pastedeploy-$pkgver
  sed -i 's/--cov//' pytest.ini
}

build() {
  cd pastedeploy-$pkgver
  python3.8 setup.py build
}

check() {
  cd pastedeploy-$pkgver
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd pastedeploy-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
