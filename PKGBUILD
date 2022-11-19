# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-trove-classifiers
pkgver=2022.10.19
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache')
arch=('any')
depends=('python38')
makedepends=('python38-calver' 'python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/pypa/trove-classifiers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5e7319028d16f917c7ddbc997f2082f3e5816dd1f93038c2193aa70a74e2e47f5bf72d8d205453fb2e0ddae3fe56affc0c78930b11767d2d55db0910a454568d')

prepare() {
  cd trove-classifiers-$pkgver
  echo "Version: $pkgver" > PKG-INFO
}

build() {
  cd trove-classifiers-$pkgver
  python3.8 setup.py build
}

check() {
  cd trove-classifiers-$pkgver
  pytest
  PYTHONPATH="$PWD"/build/lib python3.8 -m tests.lib
}

package() {
  cd trove-classifiers-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
