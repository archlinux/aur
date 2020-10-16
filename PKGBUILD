# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=json_dto
pkgver=0.2.11
pkgrel=1
pkgdesc="A small header-only library for converting data between json representation and c++ structs"
arch=(any)
url="https://github.com/Stiffstream/json_dto"
license=('BSD')
depends=(rapidjson)
makedepends=(cmake)
checkdepends=(catch2)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stiffstream/$pkgname/archive/v.$pkgver.tar.gz")
sha256sums=('9ce409a8210ee78ef5b1e60dfb919186ba6a2e928e391e46f0e1d36049e06b1c')

build() {
    cd "$pkgname-v.$pkgver"
    cmake dev -DCMAKE_INSTALL_PREFIX=/usr -DJSON_DTO_SAMPLE=Off \
        -DJSON_DTO_FIND_DEPS=On -Wno-dev
    make
}

check() {
    cd "$pkgname-v.$pkgver"
    cmake dev -DJSON_DTO_TEST=On
    make
    make test
}

package() {
    cd "$pkgname-v.$pkgver"
    make DESTDIR="$pkgdir/" install
    install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
