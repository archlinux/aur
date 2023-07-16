# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='itertree'
pkgname=python-$_pkgname
pkgver=1.0.5
pkgrel=1
pkgdesc="Python tree structure for data storage and iterations"
arch=(any)
url="https://github.com/BR1py/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d4110e130f72de0952058a584b3753cc3cb85f58eedaf72ba11bc9f9534d610e')

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
