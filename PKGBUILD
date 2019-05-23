# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Benjamin Chrétien <chretien at lirmm dot fr>

_name=kitchen
pkgname=python2-$_name
pkgver=1.2.6
pkgrel=1
pkgdesc='Kitchen contains a cornucopia of useful code'
arch=('any')
url="https://github.com/fedora-infra/$_name"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6963dd84819713aafdd55e5314dcce6df5a37430b62fd9c48770e9f1a467b2b0')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  sed -i 's/python/python2/' "$pkgdir/usr/lib/python2.7/site-packages/kitchen/pycompat24/base64/_base64.py"
}
