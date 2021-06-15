# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rpg-cli
pkgver=0.4.1
pkgrel=1
pkgdesc='Your filesystem as a dungeon!'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/facundoolano/rpg-cli'
license=('custom:MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facundoolano/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('2b68e9c53ff7fcebb319aa741e008b1f8c2ed714558302c1707a1fc87fa09164'
            '0b70c8a7eaa33e91bfa7baabccbd6735bbb0dc330539bd16f9f316bb2c8dd515')

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
