# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=toolz
pkgname=python38-toolz
pkgver=0.12.0
pkgrel=1
pkgdesc="A functional standard library for Python"
arch=(any)
url="https://github.com/pytoolz/toolz/"
license=(BSD)
depends=(python38)
makedepends=(python38-build python38-installer python38-setuptools python38-wheel)
checkdepends=(python38-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('6c1376f978a1ab469a6fcca9a5ccaf8b8f1bdf92e4484ff0bad947d6727f390ed6571426070a81a0e123725269043ded28294e57921bde2bb9ff87b048a5405f')
b2sums=('a68bd895a4d500baebae02dce389adabbebe3eaa103ed2753ebd42d84dba54d9ef0b1467738b6a2eed14af24e197a12ef6b6c6907bcf4633252256793e1eac5f')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
