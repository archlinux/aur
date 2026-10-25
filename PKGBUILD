# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

_name=deepmerge
pkgname=python-deepmerge
pkgver=4.0.0
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
sha512sums=('fb3a4955f4d9f44935b1f1efc932521345f01c667705d8062a1c35e466812e8971fe51771742c29c32f413e075690bbbc7c87a2c6fb86e5c96ebbadc8d1fa872')
b2sums=('10654d859948f01f2408b3d9d364f94047ccd868dfed144acc1764052bb95d3f2f60e6e5e47f7c7a31578db1dccb94b54f0e6c1ce9644c768c53f23d7764cad4')

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
