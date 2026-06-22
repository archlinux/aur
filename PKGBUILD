# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

_name=deepmerge
pkgname=python-deepmerge
pkgver=2.1.0
pkgrel=1
pkgdesc="A deep merging tool for Python core data structures"
arch=(any)
url="https://github.com/toumorokoshi/deepmerge"
license=(MIT)
depends=(
  python
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(python-pytest)
options=('!strip' '!debug')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('53aacb267e6c556b1d015825e238e3225b4ef9db80e9fc11898f81a67163bacb82f22c7828582a63b952564ccc124339dd5e74524b0d2d784076c2d442879ffd')
b2sums=('bf77b3e586469d65d0d1e7d6f6ffdd83b907a8f68194cde070eb99598cccd796b837558faaa3905be39a05438fbf324b263e15097262bd89381c6fdbf2d9934b')

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
