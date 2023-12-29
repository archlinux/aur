# Maintainer: David Runge <dvzrv@archlinux.org>

_name=deepmerge
pkgname=python-deepmerge
pkgver=1.1.0
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
sha512sums=('f658518c11e0ea8b4e59a686e2e6ce90916c5e798c3521ef91a1fc09ec59badd9cddb74f51973cfe50891c5e8d054909e7a8acf2156cbb884492a059196a8d97')
b2sums=('30fc1cdd7a5ce81783fa0804c20f44d4d7d62a1a6481a6defab3a2b5f542596fb4ab0d4ede5a7d4d128d188b56d17f260c67690deb89b55fb2fc76e1fbcffebc')

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
