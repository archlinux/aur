# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-deprecation
pkgver=2.1.0
pkgrel=6
pkgdesc="A library to handle automated deprecations"
arch=('any')
license=('Apache')
url="https://deprecation.readthedocs.io"
depends=('python38')
makedepends=('python38-setuptools')
source=("https://files.pythonhosted.org/packages/source/d/deprecation/deprecation-$pkgver.tar.gz")
sha512sums=('c184665d210c6eeb3f055b23e75c3714f3b18050e03bfe1384baf6c2504f1370116ae0e8c53ff818ccc54c0d633bbb3ba5791fe20b8029f3be0207b019a00275')

prepare() {
  sed -i 's/unittest2/unittest/g' deprecation-$pkgver/tests/*.py

  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd deprecation-$pkgver
  python3.8 setup.py build
}

check() {
  cd deprecation-$pkgver
  python3.8 -m unittest discover
}

package() {
  cd deprecation-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
