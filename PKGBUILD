# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rockpass
pkgver=0.9.0
pkgrel=1
pkgdesc='A small and ultrasecure Lesspass database server written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rockpass'
license=('GPL3')
depends=('sqlite')
makedepends=('rust')
backup=("etc/${pkgname}.toml")
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.service")
b2sums=('2379a95a039778c77e91f02bdcb80f25b8a8d43eeef5541354e47968a12e7b5e89a12b25be9f223fb3c600e5dee0e84a05d71751af3cf4d12f9d6b04b6833625'
        '0fa53a8afb3e842cfce314cbc580c3e2a89441f8b1155307df164ca50028e88d30212a29d847c40026105fb4a735e19863ed07fca8aeb86f51d3a8f096d8860a')

build() {
  cd "${pkgbase}-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # conf
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/${pkgname}.toml.example" \
    "${pkgdir}/etc/${pkgname}.toml"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
