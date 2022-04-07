# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qbittorrent-api
pkgname="python-$_pkgname"
pkgver=2022.4.30
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rmartin16/qbittorrent-api/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c192c72759d605d5eb8056e1353dd5ab939d5d049fdf6f70a33a93bb7f5fd1d2')
b2sums=('39590b525dfb0166a9542f7a2c48e8d58b13972b92b8427a2cdfb650868d762326fb220406a5b376c0ce5db8af4b341c26846d5681546954e10880aabe8736d7')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
