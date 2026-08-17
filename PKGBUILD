# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

_name=deepmerge
pkgname=python-deepmerge
pkgver=3.0
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
sha512sums=('54d5d05a24a664e1678ebe654785eca286bf0c41edda34c14ab3d4507f8c20ffe553379462b378f5fa244911e224beaa8dae0ef63b88777c1ef27bc3036e6956')
b2sums=('0fea763e2ab571095298f85d9eb45463a3af3664dcb8aecf7a77738b6c58f9f54b3b1e3110dcced97ec2b3bc12506b21afdf0d31526f30a0997321f1f1930884')

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
