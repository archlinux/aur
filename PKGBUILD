# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=rlog
pkgname=rlog-syslog
pkgver=0.1.0
pkgrel=1
pkgdesc='The simplest possible implementation of a syslog server written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rlog'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("https://gitlab.com/ogarcia/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        "${_pkgname}.service")
b2sums=('b9cbee1b9ae784dcd03ce7f3e1c54aaea5ae5ed2afe71f79755fe62f0a33478428032a44f5c716c0906f53581a482911ee7e9f357251cebea3187ea10851f7ad'
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
