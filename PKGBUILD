# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=kdash
pkgver=0.4.0
pkgrel=1
pkgdesc='A simple and fast dashboard for Kubernetes'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://kdash.cli.rs/'
license=('MIT')
depends=('gcc-libs' 'libxcb')
makedepends=('python' 'rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdash-rs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3d9016ba7e7872bd97306151e0eba50b83082a5107c7b71f94ce8737a0480097e3ab95e2b780290aaf8a78ee4f6a57efd5cdab80e6f771daa6254ab28d206413')

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
