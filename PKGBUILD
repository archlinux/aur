# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Previous maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-warcio
_pkg="${pkgname#python-}"
pkgver=1.8.1
pkgrel=1
pkgdesc='Streaming WARC (and ARC) IO library'
arch=('any')
url='https://github.com/webrecorder/warcio'
license=('APACHE')
depends=('python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-httpbin' 'python-requests' 'python-wsgiproxy2')
source=("$_pkg-$pkgver.tar.gz::https://github.com/webrecorder/warcio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19faa8696045074bacb755e04fc16284edf45d6f8b0619dad913cba7e60bcf75')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

## import error causes failure
# check() {
#   cd "$_pkg-$pkgver"
#   PYTHONPATH="$PWD" pytest -x
# }

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: ts=2 sw=2 et:
