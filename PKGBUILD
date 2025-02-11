# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

_name=deepmerge
pkgname=python-deepmerge
pkgver=2.0
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
sha512sums=('9580220d941226b7d5b27f8efe2f7caeea58da6d3aa48f2a20f54add75fb1f2802b17e16794f5e05f28c3943cf34ccbcb622c2073533201c5c66a4c44d0e4547')
b2sums=('bfc2803f0a955d83bf8e1fee380066475bf61962e640272b00e4df899ccdb62c7796e7717b761ee5f8f4659c53a048fcb6f519eaec0b5f54a03ade8991e783d1')

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
