# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-jaraco.vcs
_name=${pkgname#python-}
pkgver=2.3.0
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
  'python-pytest-mypy'
  'python-pytest-ruff'
  'python-types-python-dateutil'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63d31b70b860cbc46bc0691d15185e065e913171152074b6a661f6002369febd')

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
