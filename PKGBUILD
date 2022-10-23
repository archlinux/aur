# Maintainer: David Runge <dvzrv@archlinux.org>

_name=deepmerge
pkgname=python-deepmerge
pkgver=1.0.1
pkgrel=2
pkgdesc="A deep merging tool for Python core data structures"
arch=(any)
url="https://github.com/toumorokoshi/deepmerge"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f68d41b4e6eb2eca3a2c936a263c675296a37edf7ed4245c732f029fa0f3dd1a3c2da7cc2342bf5fa90eae409e039b4ea653bdcc71fa32fb1a2075d6b4d13ce5')
b2sums=('e5ca0de3815258810d982edb8cb0cf928aeac422d8bd889886b63d1a1d2d0e0c9c109c10231d2c467f638a0c84a8d3887c5d2c78ed9ac60db1cafd53ef6692ae')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
