# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=rezolus
pkgver=2.16.0
pkgrel=1
pkgdesc="Systems performance telemetry"
arch=("x86_64")
url="https://github.com/twitter/${pkgname}"
license=("Apache-2.0")
makedepends=("rust" "bcc")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("73333ad3e2ed681bd96b3918311d5135a028a2a79f8b6b467d2c7c5feb3c7c84")

build() {
  cd ${pkgname}-${pkgver}
  git init .
  cargo build --release --features bpf
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

