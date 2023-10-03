# Maintainer: HeCodes2Much <HeCodes2Much@github.com>
# Contributor: HeCodes2Much <HeCodes2Much@github.com>
# shellcheck disable=all

pkgname='i3-autolayout'
pkgver=0.2.3
pkgrel=1
pkgdesc="Service to automatically managing i3 window manager layout "
arch=('x86_64')
url='https://github.com/BiagioFesta/i3-autolayout'
license=('Apache' 'MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiagioFesta/i3-autolayout/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('14697ac8f89cc96a084f03e42427c53b5f7ce6d33fd1849ccd64de6fa1065af3')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build(){
  cd "${pkgname}-${pkgver}"
  CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m755 "target/release/i3-autolayout" "${pkgdir}/usr/bin/i3-autolayout"
  install -D -m755 "systemd/i3-autolayout.service" "${pkgdir}/usr/lib/systemd/user/i3-autolayout.service"
}
