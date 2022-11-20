# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-ukpostcodeparser
pkgver=1.1.2
pkgrel=10
pkgdesc="UK Postcode parser"
arch=('any')
license=('MIT')
url="https://github.com/hamstah/ukpostcodeparser"
depends=('python38')
makedepends=('python38-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/hamstah/ukpostcodeparser/archive/v$pkgver.tar.gz")
sha512sums=('8113522b728c095f937a9f53f21c369130e3e63c4fc3546dbea4ad1c53648742fb0e766b1254c76ee65d69dec585f1a90caa7d39ca540de1765ff5f989a702de')

build() {
  cd "$srcdir"/ukpostcodeparser-$pkgver
  python3.8 setup.py build
}

check() {
  # Expected failure: https://github.com/hamstah/ukpostcodeparser/issues/8

  cd "$srcdir"/ukpostcodeparser-$pkgver
  python3.8 -m unittest discover -s ukpostcodeparser/test -p '*.py' || echo "Tests failed"
}

package() {

  cd ukpostcodeparser-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
