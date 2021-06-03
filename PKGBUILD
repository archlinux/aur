# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rpg-cli
pkgver=0.3.0
pkgrel=1
pkgdesc='Your filesystem as a dungeon!'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/facundoolano/rpg-cli'
license=('custom:MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facundoolano/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('948deab1d2d0b44b39104c483fc6951bf0681807962f6a1ce8b0285d31d705f3'
            '3c76b0710a88491f65f732c46397ddda6439fed873b3991b7d315a68f306265c')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --all-features --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # sh (bash, zsh, ...) helper
  install -Dm644 ${pkgname}.sh "${pkgdir}/usr/share/${pkgname}/${pkgname}.sh"
  # license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
