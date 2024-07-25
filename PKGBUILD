# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='itertree'
pkgname=python-$_pkgname
pkgver=1.1.3
pkgrel=1
pkgdesc="Python tree structure for data storage and iterations"
arch=(any)
url="https://github.com/BR1py/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2ebcbf46df89d526dc46681a08706203b060187afeb1fc294869c71e15b97635')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"

  # testsuite runs performance tests for 5+ minutes
  #PYTHONPATH=src/ pytest tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
