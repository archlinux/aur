# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
pkgname=python-pylink-square
pkgver=0.12.0
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache)
depends=(python-future python-psutil python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-mock python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
# sdist on pypi.org has no tests: https://github.com/square/pylink/issues/119
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("$_name-$pkgver.tar.gz::https://github.com/square/pylink/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ff56205ea3b504e8e87d67d48e10b4bcb9b046ba67c1a6833a20c643361329be94b3abe7589ebfc95889c06502c9a9672697603a8bf40c22be0d511fa2c4b7e1')
b2sums=('504a0f1b9ae98f91c1bcd6224c79eb8254854bed7220303e120c6a66785b1deab03d5edc4b4a6ea1c7aa286ba1fd7917308e0c39f5f74dd77dd7b2633c5bea59')

build() {
  cd pylink-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd pylink-$pkgver
  pytest -v
}

package() {
  cd pylink-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
