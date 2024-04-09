# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-uhashring
pkgver=2.3
pkgrel=2
pkgdesc="Full featured consistent hashing python library compatible with ketama"
url="https://github.com/ultrabug/uhashring"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-memcached')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ultrabug/uhashring/archive/$pkgver.tar.gz")
sha512sums=('36f3ac1914a6cdfa903685931831a88a8b75300b8775ac9f865295650c777296a61fa4dd804e005821354ce796780445b06f7c3757ed0df4f8b068d5815539f8')

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
