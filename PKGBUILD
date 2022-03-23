# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=rezolus
pkgver=2.16.2
pkgrel=1
pkgdesc="Systems performance telemetry"
arch=("x86_64")
url="https://github.com/twitter/${pkgname}"
license=("Apache-2.0")
makedepends=("rust" "bcc")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6ff715879cb16f2950179c4fa376ea462b5b368806b3280682fc47493410728c")

build() {
  cd ${pkgname}-${pkgver}
  git init .
  cargo build --release --features bpf
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

