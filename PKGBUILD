# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rockpass
pkgver=0.5.0
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
sha256sums=('3bed737a6fd852973f08311ca2584f075555e7105884c2951f7472fd846732fd'
            '93183adf08ab3ba7b9e8189c30c4c01831b42fd3ff1fb4f20ad3cf7cb64c382e'
            '5175d4d689c8f9b63a4d1409ab48d4ec91e37120cec8c4be1f8ba871363be424')

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
