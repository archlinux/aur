# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mykyta Poturai <mykyta.poturai@tutanota.com>

pkgname=libthemis
pkgver=0.15.6
pkgrel=1
pkgdesc="Open-source high-level cryptographic services library."
url="https://github.com/cossacklabs/themis"
arch=('x86_64')
license=('Apache-2.0')
depends=('openssl')
provides=('libthemis.so' 'libsoter.so')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "makefile-ldconfig.patch")
sha256sums=('67c48ca11b189d91f22e5150c6ffecb245c05afe1256a2c991fbe7c6e3ac73b7'
            '5378f6535e5c2bd44d72d0f7b461307135578a656dd8f64c54367bc0a1e12a1f')

prepare() {
    cd "themis-$pkgver"
    patch -p1 -i "$srcdir/makefile-ldconfig.patch"
}

build() {
    cd "themis-$pkgver"
    make
}

check() {
    cd "themis-$pkgver"
    make test
}

package() {
    cd "themis-$pkgver"
    make install PREFIX="$pkgdir/usr/"
}
