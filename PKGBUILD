# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.9.2
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications"
arch=('any')
url="https://github.com/qdrant/qdrant"
license=('Apache')
depends=('protobuf' 'clang')
makedepends=('cargo' 'cmake')
options=('!lto')
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('c5e138d6698f58a3ea7d554a0ad4be135e01851fb90980a1d825976a0804f3d4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "target/release/schema_generator" "${pkgdir}/usr/bin/schema_generator"
  install -Dm755 "target/release/wal_inspector" "${pkgdir}/usr/bin/wal_inspector"
}
