# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=pycapnp
pkgname=python-pycapnp
pkgver=1.2.1
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto library"
url="https://github.com/capnproto/pycapnp"
license=(BSD)
arch=(x86_64)
depends=(capnproto python)
makedepends=(cython python-build python-installer python-pkgconfig python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://github.com/capnproto/$_name/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('57f62b91926bb1b3f28b250d2e98064540538e145d2b3899482e3f9f615f0917c6923c19f3426340eea7799f6e9fe471c9c2d13e5d283298ef5b2fdd4dcc743b')

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
