# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.4.1
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
sha256sums=('bb18e4b63e76f81a3c7fca51838063538eb7b48febf6f70763f29e20c016ebdc')

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
