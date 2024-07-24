# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=json_dto
pkgver=0.3.4
pkgrel=1
pkgdesc="A small header-only library for converting data between json representation and c++ structs"
arch=(any)
url="https://github.com/Stiffstream/json_dto"
license=('BSD-3-Clause')
depends=(rapidjson)
makedepends=(cmake)
checkdepends=(catch2-v2)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stiffstream/$pkgname/archive/v.$pkgver.tar.gz")
sha256sums=('1b9595dbd86fa90edf621b72f5f4dac43170339250e9e650ede5269ff6fa3f2e')

build() {
    cd "$pkgname-v.$pkgver"
    cmake dev -DCMAKE_INSTALL_PREFIX=/usr -DJSON_DTO_SAMPLE=Off \
        -DJSON_DTO_TEST=On \
        -DCMAKE_BUILD_TYPE=None \
        -DJSON_DTO_FIND_DEPS=On -Wno-dev
    make
}

check() {
    cd "$pkgname-v.$pkgver"
    make
    make test
}

package() {
    cd "$pkgname-v.$pkgver"
    make DESTDIR="$pkgdir/" install
    install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
