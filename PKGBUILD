# Maintainer: Julio González <juliolokooo <at> gmail.com>

pkgname=lib32-cjson
pkgver=1.7.15
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C (32-bit)"
arch=(x86_64)
license=("MIT")
depends=("cjson")
makedepends=("cmake")
url="https://github.com/DaveGamble/cJSON"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('0b32a758c597fcc90c8ed0af493c9bccd611b9d4f9a03e87de3f7337bb9a28990b810befd44bc321a0cb42cbcd0b026d45761f9bab7bd798f920b7b6975fb124')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="i686-pc-linux-gnu-pkg-config"
  cmake -B build -S "cJSON-${pkgver}" -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr/lib -DCMAKE_INSTALL_LIBDIR=/usr/lib32
  make -C build
}

check() {
  make -C build check
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  rm -r "$pkgdir/usr/lib/include"
  install -Dm644 "$srcdir/cJSON-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
