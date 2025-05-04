# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rlpcli
pkgver=1.3.4
pkgrel=1
pkgdesc='Tiny LessPass API server client CLI to get passwords and site settings'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rlpcli'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('d454821a9e818b25725dfb17d6287ff5040bb3d81253b8fcd062f93b7f5a752548135de4ba7c7a4e8c646e2645fb1890af36bd50405b2cc107c9c22ee14fb3c6')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
