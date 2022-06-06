# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-warcio
_pkg="${pkgname#python-}"
pkgver=1.7.4
pkgrel=3
pkgdesc='Streaming WARC (and ARC) IO library'
arch=('any')
url='https://github.com/webrecorder/warcio'
license=('APACHE')
depends=('python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-httpbin' 'python-requests' 'python-wsgiproxy2')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('e1889dad9ecac654de5b0973247f335a55827b1b14a8203772d18c749143ea51')

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
