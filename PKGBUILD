# Maintainer: Mark Pustjens <pustjens@dds.nl>

pkgname=json-schema-validator
pkgver=2.2.0
pkgrel=3
pkgdesc="JSON schema validator for JSON for Modern C++"
arch=(any)
url="https://github.com/pboettch/json-schema-validator"
license=(MIT)
depends=(nlohmann-json)
makedepends=(cmake git)
source=(
  https://github.com/pboettch/json-schema-validator/archive/refs/tags/${pkgver}.zip
)
sha512sums=(0a078c7a43d6651ed7e0fc444087695ed99b02fd3460a526d79634960425a6f7f59d8103f8132f6d16d129cff8def09289277f2575a3e82d90408a1118c2637c)

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
