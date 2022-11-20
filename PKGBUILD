# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-mox3
pkgver=1.1.0
pkgrel=5
arch=('any')
pkgdesc='Mock object framework for Python'
url='https://docs.openstack.org/developer/mox3'
license=('Apache')
depends=('python38-pbr' 'python38-fixtures')
checkdepends=('python38-oslotest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/mox3/archive/$pkgver.tar.gz")
sha512sums=('e531e0d5e61c7eca75733770a466d6bd5f451250c250c2ba7e751ba9a4e9fae24eb58e452687c3838b341fa0a87f56975b83c3a1164774969bea159719742d10')

export PBR_VERSION=$pkgver

prepare() {
  # Python 3.6 fixes
  sed -i 's/, flags=4//' mox3-$pkgver/mox3/tests/test_mox.py
}

build() {
  cd mox3-$pkgver
  python38 setup.py build
}

check() {
  cd mox3-$pkgver
  stestr run
}

package() {
  cd mox3-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
