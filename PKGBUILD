# Maintainer: David Runge <dvzrv@archlinux.org>

_name=deepmerge
pkgname=python-deepmerge
pkgver=1.1.1
pkgrel=2
pkgdesc="A deep merging tool for Python core data structures"
arch=(any)
url="https://github.com/toumorokoshi/deepmerge"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('8ba4a225d588c96c3c852783774d5d690c5dd0caa1988f5969ce6446a11ba6035667baeda7e419cae40c4c1dcf7a15ee7149a10c1e33dba6b7775ddbad41130d')
b2sums=('ef6fbd30185a2990c72d6de0950275dd6f9f3e61c0c9c969fd69dab2123025d016ade98d42f09b30328b3cb5659b29b2d07836db4657acde97d9a2cc40c07039')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --skip-dependency-check --no-isolation
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
