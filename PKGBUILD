# Maintainer: Julio González <juliolokooo <at> gmail.com>

pkgname=lib32-cjson
pkgver=1.7.19
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C (32-bit)"
arch=(x86_64)
license=("MIT")
depends=("cjson")
makedepends=("cmake")
url="https://github.com/DaveGamble/cJSON"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('7b22bdd05b8e0bf8b24ab79db128dbab9f8c2c167f4b1d3073922b8ff1e0f0e8917322283d6d4091002f014f42692984f4f641761f05965d3b66fb3eca14dc46')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="i686-pc-linux-gnu-pkg-config"
  cmake -B build -S "cJSON-${pkgver}" -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr/lib -DCMAKE_INSTALL_LIBDIR=/usr/lib32 -DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
