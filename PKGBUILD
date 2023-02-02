# Maintainer: Mario Finelli <mario at finel dot li>

_name=onepasswordconnectsdk
pkgname=python-${_name}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python SDK for 1Password Connect"
arch=(any)
url=https://github.com/1Password/connect-sdk-python
license=(MIT)
depends=(python python-dateutil python-requests python-six)
makedepends=(python-build python-installer python-poetry
             python-trove-classifiers python-wheel)
checkdepends=(python-pytest python-pytest-cov)
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
# we use the tarball from github because the pypi source doesn't include tests
source=(${url}/archive/v$pkgver/$_name-$pkgver.tar.gz)
sha256sums=('a5f72c794b1ee552817ddf2c9705c192970dd65442a1ae5d74b9cc91ed656405')

build() {
  cd connect-sdk-python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd connect-sdk-python-$pkgver
  pytest
}

package() {
  cd connect-sdk-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
