# Maintainer: Dmitry Valter <`echo ZC12YWx0ZXJAcHJvdG9ubWFpbC5jb20K | base64 -d`>
# Contributor: Jörg Bornemann <`echo am9lcmcuYm9ybmVtYW5uQHF0LmlvCg== | base64 -d`>

pkgname=argagg
pkgver=0.4.7
pkgrel=6
pkgdesc='Simple C++ command line argument/option parser'
arch=('any')
url='https://github.com/vietjtnguyen/argagg'
license=('MIT')
makedepends=('cmake' 'doxygen')
options=('!lto')
provides=('argagg')
source=(
        "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "0001-gcc-werror.patch"
)
sha512sums=(
        '85634bff33236ffcb0aea03a6fa4b3529b6d1faa03f8e030f3c5401fc453bb5e1964f7d0644e4f3fc089ccd7751ea94c466e02b85f7c9701ce21adcc20c0b058'
        '50c877ac9a9e94896f6fa424470a13b9a4678dfe2959d8ff71a7694128b33def56cc806efc3ad0f6955712a78061608eae5c5669d772ddaceac195fa08e54483'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i ../0001-gcc-werror.patch  
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5'

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build -- install
}

check () {
  ctest --test-dir build
}
