# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=rlog
pkgname=rlog-syslog
pkgver=0.2.0
pkgrel=1
pkgdesc='The simplest possible implementation of a syslog server written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rlog'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust')
source=("https://gitlab.com/ogarcia/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        "${_pkgname}.service")
b2sums=('e56040fbb20ad4659c0adac475c2f87d2032d74bfb8700cd8beb86e5091bac42d298457c94e59ff30b590f72945a54648476ea69ead08fae61f62a50381960db'
        '32d17538458b806b3e2f74d3511bd7989eb31ebf2891c3533a1abcd0945644bf20aaace9dca9770121bb0ad383cd9fd2cecf3f1c6502c34523b6b0cba7ff2041')

build() {
  cd "${_pkgname}-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/target/release/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  # service
  install -Dm644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
