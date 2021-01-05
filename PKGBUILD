# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=ftl-sdk
pkgver=0.10.0
pkgrel=1
pkgdesc="Software Development Kit for Mixer's FTL Protocol"
arch=(x86_64)
url="https://github.com/Scrumplex/ftl-sdk"
license=("custom:MIT")
depends=("jansson" "curl")
makedepends=("cmake" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Scrumplex/ftl-sdk/archive/${pkgver}.tar.gz")
sha512sums=('c6f58016836955e4345e21126680a98a1626ea8d66f2b3c16136d46e21a6072ee4c2899485436682de13d1d2145502e91f03732057d50bea95b55743d65ce205')


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
