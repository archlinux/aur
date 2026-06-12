# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
pkgname=python-pytest-deadfixtures
_name="${pkgname#python-}"
pkgver=3.1.0
pkgrel=1
pkgdesc="Pytest plugin to list unused fixtures in tests"
arch=('any')
url="https://github.com/jllorencetti/pytest-deadfixtures"
license=('MIT')
depends=(
  'python'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('921bc4def8641c650e6ac7cd8ce5f35d8df445b783c46618115f246e50726230')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
