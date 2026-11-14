# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rockpass
pkgver=0.13.2
pkgrel=1
pkgdesc='A small and ultrasecure Lesspass database server written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rockpass'
license=('GPL-3.0-or-later')
depends=('sqlite')
makedepends=('rust')
backup=("etc/${pkgname}.toml")
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.service")
b2sums=('23acc673e4b5fb4466188c16227cac6268aa13c39e90812e62f8911dbd76be4b619c92317956c3fdf9a8a24c6b5c6f4c6026184875be099416481ed302c41e3b'
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
