# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=pycapnp
pkgname=python-pycapnp
pkgver=1.2.0
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=(BSD)
arch=(x86_64)
depends=(capnproto python)
makedepends=(cython python-build python-installer python-pkgconfig python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://github.com/capnproto/$_name/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('2221daa602b222563a483d73a4c0cb616d7b07aeae48d9a9b50a26cec002c80a00b5080bbe32c7094fa76d05aacc3d1d84322fdb40cbf301a208744ab246c06f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pycapnp-$pkgver
  PYTHONPATH="build/lib.linux-$CARCH-cpython-310" pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
