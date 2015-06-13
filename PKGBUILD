# Maintainer: Troels Jacobsen <tkjacobsen@gmail.com>
pkgname=evernote-sdk-python
pkgver=1.25.0
pkgrel=4
pkgdesc='Evernote SDK for Python'
arch=(any)
url="https://github.com/evernote/$pkgname"
license=('MIT')
depends=('python2-thrift' 'python2-oauth2')
makedepends=('python2-setuptools')
conflicts=("$pkgname-git")
source=("$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver-thrift.patch")
sha256sums=('f438f430bafa1d5113d39426100bdbda5876bde1e8877e3b29929e2dbc8d9979'
            'f8a3a22bd22606920e140f894d57d52f6fd137cdbb88078564ca9854c160081a')

build () {
	cd "$pkgname-$pkgver"
    patch -p0 < ../$pkgname-$pkgver-thrift.patch
}

package() {
	cd "$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/"
    rm -R "$pkgdir/usr/lib/python2.7/site-packages/thrift/"
}
