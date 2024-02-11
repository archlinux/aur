# Maintainer: Tadeusz Magura-Witkowski <tadeuszmw gmail>

pkgname=lib45d
pkgver=0.3.6
pkgrel=1
pkgdesc="45Drives C++ Library."
arch=('x86_64')
url="https://github.com/45Drives/lib45d"
license=('GPL3')
makedepends=('gcc' 'make' 'patch')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/45Drives/lib45d/archive/refs/tags/v${pkgver}.tar.gz" "00-missing-include.patch")
sha256sums=('76ae1811beffe67025fd72a055dd662496cfbbe4790e2bb68d42980c48cadd02'
            '373b23f23c8d832780484379aedc0c4003d744a6ab433e0d1c85fa91074f7e55')
depends=('glibc')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/00-missing-include.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make DEVEL=1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" DEVEL=1
}
