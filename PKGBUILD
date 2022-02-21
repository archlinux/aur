# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name=pytest-discord

pkgname=python-pytest-discord
pkgver=0.1.0
pkgrel=1
pkgdesc='Pytest plugin to report test results to a Discord channel'
arch=('any')
url='https://github.com/thombashi/pytest-discord'
license=('MIT')
depends=(
  'python-aiohttp'
  'python-discord'
  'python-pathvalidate'
  'python-pytest'
  'python-pytest-md-report'
  'python-typepy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-mock' 'python-dateutil' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz.asc")
sha256sums=('4f7a1a2841106611ef071122d918f93fbf17504b4af4fc0a5f5cbf80149e2a77'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=./ pytest -x -c /dev/null --disable-warnings
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
