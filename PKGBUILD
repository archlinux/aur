# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=ftl-sdk
pkgver=0.10.1
pkgrel=1
pkgdesc="Software Development Kit for Mixer's FTL Protocol"
arch=(x86_64)
url="https://github.com/Scrumplex/ftl-sdk"
license=("custom:MIT")
depends=("jansson" "curl")
makedepends=("cmake" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Scrumplex/ftl-sdk/archive/${pkgver}.tar.gz")
sha512sums=('d423dec8cf2f5887989d5435410d9cfdee744b6cd6badcbb14b6013a205d9e8b2dbcda04e16cf11978dd5eb5193d99112109872a9462fc5b722c5f01fcd492bd')


build() {

    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {

    make DESTDIR="$pkgdir" -C build install

    cd "$pkgname-$pkgver"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
