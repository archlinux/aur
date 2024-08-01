# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-jaraco.vcs
_name=${pkgname#python-}
pkgver=2.3.1
pkgrel=1
pkgdesc="Facilities for working with VCS repositories"
arch=('any')
url="https://github.com/jaraco/jaraco.vcs"
license=('MIT')
depends=(
  'python-dateutil'
  'python-jaraco.classes'
  'python-jaraco.versioning'
  'python-more-itertools'
  'python-packaging'
  'python-tempora'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-jaraco.path'
  'python-pygments'
  'python-pytest'
  'python-pytest-cov'
  'python-pytest-enabler'
  'python-pytest-home'
  'python-pytest-mypy'
  'python-pytest-ruff'
  'python-types-python-dateutil'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f174630e6a91a04b3fe08025bf9b7d4a23fb9b05da4e856d3c721539e27ed74')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=./ pytest --ignore jaraco/vcs/__init__.py
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
