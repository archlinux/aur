# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-uhashring
pkgver=2.2
pkgrel=1
pkgdesc="Full featured consistent hashing python library compatible with ketama"
url="https://github.com/ultrabug/uhashring"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-memcached')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ultrabug/uhashring/archive/$pkgver.tar.gz")
sha512sums=('b9cbe614cda9a487e176aa994625f03986c3ecad84c7dd2c2ce654bf9d65ab2205a8038eff5a7782a34714d533fcf8963e9b6f93f0d560c4ba08678fbd899357')

build() {
  cd uhashring-$pkgver
  python -m build -nw
}

check() {
  cd uhashring-$pkgver
  pytest
}

package() {
  cd uhashring-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
