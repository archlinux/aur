# Maintainer: James An <james@jamesan.ca>

pkgname=python2-ntplib
_pkgname=${pkgname#python2-}
pkgver=0.3.3
pkgrel=2
pkgdesc="Python NTP library"
arch=('any')
url="http://code.google.com/p/$_pkgname"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('c7cc8e9b09f40c84819859d70b7784ca')

prepare() {
  cd "$_pkgname-$pkgver"
  
  sed -n '/^# Copyright/,/^# SOFTWARE/{s/^# \?//;p}' ntplib.py > ../LICENSE
}

build() {
  cd "$_pkgname-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  
  python2 test_ntplib.py
}

package() {
  cd "$_pkgname-$pkgver"
  
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
