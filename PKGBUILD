# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mykyta Poturai <mykyta.poturai@tutanota.com>

pkgname=libthemis
pkgver=0.15.7
pkgrel=1
pkgdesc="Open-source high-level cryptographic services library."
url="https://github.com/cossacklabs/themis"
arch=(x86_64)
license=(Apache-2.0)
depends=(openssl)
provides=(libthemis.so libsoter.so)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "makefile-ldconfig.patch")
sha256sums=('f71121a7aa9b5c3dc30c5cae59ec1da684fa35c028be214ab0578c93e499fe09'
            '5378f6535e5c2bd44d72d0f7b461307135578a656dd8f64c54367bc0a1e12a1f')

prepare() {
    patch -p1 -d "themis-$pkgver" < "$srcdir/makefile-ldconfig.patch"
}

build() {
    cd "themis-$pkgver"
    make themis_shared
}

check() {
    cd "themis-$pkgver"
    make test
}

package_libthemis() {
    cd "themis-$pkgver"
    make install PREFIX="$pkgdir/usr/"
    make themispp_install PREFIX="$pkgdir/usr"
}

