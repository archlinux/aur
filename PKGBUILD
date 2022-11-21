# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-warlock
pkgver=2.0.1
pkgrel=1
pkgdesc="Python object model built on JSON schema and JSON patch."
arch=('any')
license=('Apache')
url="https://github.com/bcwaldon/warlock"
depends=('python38-jsonschema' 'python38-jsonpatch')
makedepends=('python38-build' 'python38-installer' 'python38-poetry-core')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcwaldon/warlock/archive/$pkgver.tar.gz")
sha512sums=('f354f0dd2af524a9e09ed03b072e1f68859fc70bf5ec083f8853fde2f1cec3172bef42318df176a3cf5fa48d93f030010db81d710961f2b05a092a4ee25041c1')

prepare() {
  cd warlock-$pkgver
  sed -i '/--cov/d' pytest.ini
}

build() {
  cd warlock-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd warlock-$pkgver
  pytest
}

package() {
  cd warlock-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
