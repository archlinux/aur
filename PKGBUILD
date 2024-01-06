# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: JustKidding <jk@vin.ovh>

pkgname=turbo-base64
_pkgname=Turbo-Base64
pkgver=2023.08
pkgrel=2
pkgdesc="Fastest Base64 SIMD Encoding library"
arch=("any")
url="https://github.com/powturbo/Turbo-Base64"
license=("GPL3")
makedepends=("cmake")
source=("https://github.com/powturbo/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b874ef7731ce5c1bcf665b703fca1ce896bfe8aaed2725ac725b4f1762eda5b8')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
  cmake --build build -j "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
