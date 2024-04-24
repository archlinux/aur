# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-rst.linker
_name=${pkgname#python-}
pkgver=2.6.0
pkgrel=1
pkgdesc="Tools for adding metadata and hyperlinks to reStructuredText"
arch=('any')
url="https://github.com/jaraco/rst.linker"
license=('MIT')
depends=(
  'python-jaraco.vcs'
  'python-jaraco.context'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
#checkdepends=(
#  'python-path'
#  'python-pytest-black'
#  'python-pytest-cov'
#  'python-pytest-enabler'
#  'python-pytest-flake8'
#  'python-pytest-mypy'
#  'python-types-python-dateutil'
#)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f45f2542e0888ebc6b611291ad7ee80448d3cf70b24cf587dabe5ca189cc8b5')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  python -m venv --clear --without-pip --system-site-packages .testenv
#  .testenv/bin/python -m installer dist/*.whl
#  .testenv/bin/python -m pytest || :
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
