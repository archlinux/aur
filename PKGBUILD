# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

_name=deepmerge
pkgname=python-deepmerge
pkgver=3.0.1
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
sha512sums=('eed09c60be1187e18e66f8a82bf202f89c3577a30e52702a5e9a8e1ef66bd74b893111b0cfbc458d660c9224845f72cc0791603eb32e1499cfd78453104a7bc1')
b2sums=('0aed21b2bbfbcb96973d28bb333474f809adf4893286980682006f96d5ea8a0a4d89b6025f537c3252227e20295f7408560ed23260b66d3e5e44fa3bf171e4dd')

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
