# Maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=python-xmodem
_pkgname=${pkgname#python-}
pkgver=0.4.7
pkgrel=2
pkgdesc="Python XMODEM protocol implementation"
arch=('any')
url="https://github.com/tehmaze/xmodem"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f22ec5111a33e2d6ad8060fe9e7065f175cd54eec9775ef72dc9c9b743f297c7ef8c154030887db1c136160d263567d1a54ba43a9cbbb7da1284f3ff0076a3ca')

build() {
  cd $_pkgname-$pkgver
  python -m build --no-isolation --wheel
}

package() {
  cd $_pkgname-$pkgver
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"

  mkdir -p $pkgdir/usr/share/doc
  mv $pkgdir/usr/doc $pkgdir/usr/share/doc/$pkgname
}
