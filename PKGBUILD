# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=json_dto
pkgver=0.3.3
pkgrel=1
pkgdesc="A small header-only library for converting data between json representation and c++ structs"
arch=(any)
url="https://github.com/Stiffstream/json_dto"
license=('BSD')
depends=(rapidjson)
makedepends=(cmake)
checkdepends=(catch2-v2)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stiffstream/$pkgname/archive/v.$pkgver.tar.gz")
sha256sums=('c52857c074f4e204426a52160e2699694c45bb93e9297ca535e2d5fdf54ae187')

build() {
    cd "$pkgname-v.$pkgver"
    cmake dev -DCMAKE_INSTALL_PREFIX=/usr -DJSON_DTO_SAMPLE=Off \
        -DJSON_DTO_TEST=On \
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
