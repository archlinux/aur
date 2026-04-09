# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=kdash
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple and fast dashboard for Kubernetes'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://kdash.cli.rs/'
license=('MIT')
depends=('gcc-libs' 'libxcb')
makedepends=('git' 'python' 'rust')
options=('!lto')
source=("${pkgname}::git+https://github.com/kdash-rs/${pkgname}.git#tag=v${pkgver}")
b2sums=('35601c86ea365440989b50359c090b596c1ccbee1047575774cc63f0b0bbb971ab1b5d8316a9515bcc36499a2789aedb56b572761cac2ed1f3cb7011c1659239')

prepare() {
  cd "${pkgname}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # license
  install -D -m644 "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
