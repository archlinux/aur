# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=kdash
pkgver=0.3.7
pkgrel=1
pkgdesc='A simple and fast dashboard for Kubernetes'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://kdash.cli.rs/'
license=('MIT')
depends=('gcc-libs' 'libxcb')
makedepends=('python' 'rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdash-rs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('72c1f31eb187f65bba335795a2b2af7f267a432b3eb6a528e9505c6cc2261dcff370a1240c33502deb734dd7d2b34ed3eced7e483d4f54e38ad712ab6cadc6e2')

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
