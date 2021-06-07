# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rpg-cli
pkgver=0.4.0
pkgrel=1
pkgdesc='Your filesystem as a dungeon!'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/facundoolano/rpg-cli'
license=('custom:MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facundoolano/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('b7337f5337ce99741c870acc8358fd25af0c013fe15de17dad1682c41099e67f'
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
