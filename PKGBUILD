# Maintainer: haxibami <contact at haxibami dot net>

pkgname=qdrant
pkgver=1.7.3
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
sha256sums=('af975a514a32b9eee8c7702ce4ffec0e3904b5e1c953f2fa2889e2b05c5c88fc')

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
