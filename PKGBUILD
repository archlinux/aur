# Maintainer: Julio González <juliolokooo <at> gmail.com>

pkgname=lib32-cjson
pkgver=1.7.16
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C (32-bit)"
arch=(x86_64)
license=("MIT")
depends=("cjson")
makedepends=("cmake")
url="https://github.com/DaveGamble/cJSON"
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('3a894de03c33d89f1e7ee572418d5483c844d38e1e64aa4f6297ddaa01f4111f07601f8d26617b424b5af15d469e3955dae075d9f30b5c25e16ec348fdb06e6f')

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
