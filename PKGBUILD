# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=atopile
pkgver=0.2.69
pkgrel=1
pkgdesc="A tool to build electronic circuit boards with code"
arch=(any)
url="https://github.com/atopile/atopile"
license=(Apache-2.0)
depends=(
  python
  python-antlr4
  python-attrs
  python-case-converter
  python-cattrs
  python-click
  python-deepdiff
  python-eseries
  python-gitpython
  python-jinja
  python-natsort
  python-networkx
  python-pint
  python-pydantic
  python-quart
  python-quart-cors
  python-quart-schema
  python-requests
  python-rich
  python-ruamel-yaml
  python-scipy
  python-semver
  python-toolz
  python-urllib3
  python-watchfiles
  python-yaml
)
makedepends=(
  python-build
  python-hatch-vcs
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d10215b07bb99e90ce05dbb9892e1461bd22c27de3588c7bfcbb0080e17de547')

build() {
  cd $pkgname-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
