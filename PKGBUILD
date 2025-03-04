# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-jaraco.vcs
_name=${pkgname#python-}
pkgver=2.4.1
pkgrel=1
pkgdesc="Facilities for working with VCS repositories"
arch=('any')
url="https://github.com/jaraco/jaraco.vcs"
license=('MIT')
depends=(
  'python-dateutil'
  'python-jaraco.classes'
  'python-jaraco.path'
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
  'python-pygments'
  'python-pytest'
  'python-pytest-enabler'
  'python-pytest-home'
  'python-pytest-mypy'
  'python-pytest-ruff'
  'python-types-python-dateutil'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ca5186d85f6bb17ca5305340fbe1ddab9cc739830ef67adf2e158fd598e1500')

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
