# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=salut
pkgver=0.1.0
pkgrel=1
pkgdesc="An animated mouse centric notification daemon made with snui."
arch=(x86_64)
url="https://gitlab.com/snakedye/salut"
license=(MPL2)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
depends=('libxkbcommon' 'fontconfig')
install=${pkgname}.install
makedepends=(rust)
sha256sums=('c0068f4c64461e146a80c87c3e72918ca00d54f30c0b5f589e902cbf41b72ba8')

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
