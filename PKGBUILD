# Maintainer: Mark Pustjens <pustjens@dds.nl>

pkgname=json-schema-validator
pkgver=2.4.0
pkgrel=1
pkgdesc="JSON schema validator for JSON for Modern C++"
arch=(any)
url="https://github.com/pboettch/json-schema-validator"
license=(MIT)
depends=(nlohmann-json)
makedepends=(cmake git)
source=(
  https://github.com/pboettch/json-schema-validator/archive/refs/tags/${pkgver}.zip
)
sha512sums=(45003f6205e719eca3c5c1e464ea297bd7debd6a960b33e84aabda995ee2e7ad319830dfe7d2a6a1a22e426984bb4cff794ceb44a086a1a605a9eea82c2b4b5d)

build() {
  mv ${pkgname}-${pkgver} ${pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=None \
		-DBUILD_SHARED_LIBS=On \
        -Wno-dev \
        -B build \
        -S $pkgname
  make VERBOSE=1 -C build
}

package() {
  make DESTDIR="$pkgdir" install -C build
  install -vDm 644 $pkgname/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
