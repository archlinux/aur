# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=sqlalchemy-jsonfield
pkgname=python-$_pyname
pkgver=1.0.1.post0
pkgrel=1
arch=(any)
pkgdesc='Storing dicts at SQL independently from JSON type support'
url='https://github.com/penguinolog/sqlalchemy_jsonfield'
license=(Apache)
depends=(python-sqlalchemy)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('f1187c3da2ecc37e69439f2e1b7cf9e4c56751c0a14ba9b3a949c831e5036896')

build() {
  cd "$srcdir/${_pyname/-/_}-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/${_pyname/-/_}-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  test-env/bin/python -m pytest
}

package() {
  cd "$srcdir/${_pyname/-/_}-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}

