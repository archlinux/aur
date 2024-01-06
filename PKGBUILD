# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=kdash
pkgver=0.4.5
pkgrel=1
pkgdesc='A simple and fast dashboard for Kubernetes'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://kdash.cli.rs/'
license=('MIT')
depends=('gcc-libs' 'libxcb')
makedepends=('python' 'rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdash-rs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5072850a7e374bc11438c90a44cdca767f12957e767d45b5626fa98cc50e77b17234f6718585369e59ea2abc4a6c2412b586bc3406b6ccb92a5f1c5c9cd70250')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # license
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
