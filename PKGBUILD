# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=salut
pkgver=0.2.0
pkgrel=1
pkgdesc="An animated mouse centric notification daemon made with snui."
arch=(x86_64)
url="https://gitlab.com/snakedye/salut"
license=(MPL2)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
depends=('libxkbcommon' 'fontconfig')
install=${pkgname}.install
makedepends=(rust)
sha256sums=('bf20a48d986897a778b0a5ce593f94524178a004a21fb63d4957fda5fb63d8c0')

build() {
  cd "${pkgname}-v${pkgver}"
  cargo build --release
}

check() {
  cd "${pkgname}-v${pkgver}"
  cargo test --release
}

package() {
  install -Dm755 "${pkgname}-v${pkgver}/target/release/salut" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-v${pkgver}/config/config.ini" \
    "${pkgdir}/usr/share/doc/salut/config.ini"
}
