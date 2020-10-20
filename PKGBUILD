# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=findatapy
pkgname=python-$_pkgname
pkgver=0.1.18
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
sha256sums=('1121ae040c34279ae2318faad51be7b454fb7921d61d7d5b37b1cc911c732207')

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
