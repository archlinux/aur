# Maintainer: Michał Wojdyła <micwoj9292 at gmail dot com>

pkgname=python2-pytz
pkgver=2023.3.post1
pkgrel=2
arch=('any')
url="https://pypi.python.org/pypi/pytz"
license=("MIT")
pkgdesc="Cross platform time zone library for Python2"
depends=('python2')
source=("https://pypi.io/packages/source/p/pytz/pytz-${pkgver}.tar.gz"
        "0001-Use-the-system-zoneinfo-from-the-tzdata-package.patch")
sha512sums=('c2f1bd52e42c7d1014b8aebf3544b865eb5ae5e17146253406def72785af14bcfe34b9db6b71ca91a3c988c496fbe93e5d1731bee66349463c992be619d21f2c'
            '3cbd497313c3049a2ae04298118aefb6dfa9ec4626078c665c95c13a78ae944b33a68813aea0c53b02b0532b64221cca4a0cd2153bd91b3760916bc3c0f6df8f')
validpgpkeys=('C7ECC365AB6F255E1EB9BA1701FA998FBAC6374A')

prepare() {
    cd pytz-$pkgver

    patch -p2 -i ../0001-Use-the-system-zoneinfo-from-the-tzdata-package.patch
    rm -r pytz/zoneinfo/
}

build(){
    cd pytz-$pkgver
    python2 setup.py build
}

check(){
    cd pytz-$pkgver/pytz/tests
    python2 test_tzinfo.py
}

package(){
    cd pytz-$pkgver
    python2 setup.py install --root="$pkgdir"/ --skip-build
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
