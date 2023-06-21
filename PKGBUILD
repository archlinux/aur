# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=kdash
pkgver=0.3.6
pkgrel=1
pkgdesc='A simple and fast dashboard for Kubernetes'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://kdash.cli.rs/'
license=('MIT')
depends=('gcc-libs' 'libxcb')
makedepends=('python' 'rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdash-rs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('69346ee820d9c5d23e7383995fe3a3d992cf8409942922e5c8fb631b0c4ff8a61fd6f89fadb1c573e7ab77226e87242920aa9c7fc0b2b4e882b0ccb09037558b')

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
