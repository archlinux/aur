# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgbase=python-pywapi
pkgname=(python-pywapi python2-pywapi)
_pkgname=pywapi
pkgver=0.3.8
pkgrel=4
arch=('any')
#url="http://code.google.com/p/python-weather-api"
url="https://launchpad.net/python-weather-api"
license=('MIT')
makedepends=('python' 'python2')
source=(https://launchpad.net/python-weather-api/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('75bf8257f32f2d36169d57d92566cdb1')

prepare() {
  rm -rf ${_pkgname}2-$pkgver
  cp -a $_pkgname-$pkgver ${_pkgname}2-$pkgver 

  #cd ${_pkgname}2-$pkgver
  #sed "s|\(python\).*|\12|" -i $_pkgname.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build

  cd "$srcdir/${_pkgname}2-$pkgver"
  python2 setup.py build
}

package_python-pywapi() {
  pkgdesc="Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs"
  depends=('python')

  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pywapi() {
  pkgdesc="Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs"
  depends=('python2')

  cd ${_pkgname}2-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

