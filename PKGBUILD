# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-vdf-solstice
_name=vdf
pkgver=3.5
pkgrel=1
pkgdesc="Library for working with Valve's VDF text format (Solstice Game Studios fork)"
arch=('any')
url="https://github.com/solsticegamestudios/vdf"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov')
provides=('python-vdf')
conflicts=('python-vdf')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('79768533023f9fd08d329924947912408ce65a97680e44422cbe2aff0d1594bb')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest --tb=short --cov-config .coveragerc --cov=vdf tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
