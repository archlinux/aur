# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=findatapy
pkgname=python-$_pkgname
pkgver=0.1.12
pkgrel=1
pkgdesc="Python library to download market data via Bloomberg, Quandl, Yahoo etc."
arch=('any')
url="https://github.com/cuemacro/findatapy"
license=('APACHE')
depends=('python-pandas' 'python-numpy' 'python-keyring' 'python-twython'
         'python-openpyxl' 'python-numba' 'python-alpha_vantage')
optdepends=('python-blpapi: Bloomberg Python Open API')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=('101f8b3058f1bef674c3b4088070526af3046808626549242b23ec670e0d1903')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  VERSION=`python --version | awk -F' ' '{print $2}'`
  cd "$pkgdir/usr/lib/python${VERSION:0:3}/site-packages"
  rm -r doc tests findatapy_examples
}
