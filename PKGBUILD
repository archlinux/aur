# Maintainer: Troels Jacobsen <tkjacobsen@gmail.com>
pkgname=evernote-sdk-python
pkgver=1.25.0
pkgrel=3
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
            '9dcbccc42a0aaf7a08e3e6d06ff87fad7f1f674e16e767f80f9d1b8c2d649da8')

build () {
	cd "$pkgname-$pkgver"
    patch -p0 < ../$pkgname-$pkgver-thrift.patch
}

package() {
	cd "$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/"
    rm -R "$pkgdir/usr/lib/python2.7/site-packages/thrift/"
}
