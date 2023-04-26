# Maintainer: Thomas Arnhold <thomas at arnhold dot org>
pkgname=python-yahooquery
_name=${pkgname#python-}
pkgver=2.3.1
pkgrel=1
pkgdesc="New time-based UUID formats which are suited for use as a database key"
arch=('any')
url="https://github.com/dpguthrie/yahooquery/"
license=('MIT')
depends=('python' 'python-lxml' 'python-pandas' 'python-requests-futures' 'python-tqdm')
optdepends=('python-selenium')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-setuptools' 'python-wheel')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00738a6e5c0895a62a552985bfee5f4e187c036e4b32bbcf4cb5bea488ba7c1f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

