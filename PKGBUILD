# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rockpass
pkgver=0.6.0
pkgrel=1
pkgdesc='A small and ultrasecure Lesspass database server written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/rockpass'
license=('GPL3')
depends=('sqlite')
makedepends=('rust')
backup=("etc/${pkgname}.conf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.service")
b2sums=('92b2cb27a49786ca8d3994ea9e878f53533c75073bc8cc0de456a6f7475c2afa6c80d4a0d03f57ff69443492b2b18f86f658b6705f19ab1b3b6a9b81b9d65f60'
        'fb14ea017d62647acd111e0c834ff1357a55e6b0c4692f0e372f969024f004af806cae99b5311a2d1c7975e88e0049c6ebb92fa6f0532df0b06d893d564daf80'
        '754c712cc81cf4c63f6aae586386a21c50fa30e8730de62d3e73e0cdf000dd7bf1abcf54371036e22568f390b6a0b559d1064dae244f1e4b2cf9bd3def90c149')

build() {
  cd "${pkgbase}-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # conf
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
