# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rlpcli
pkgver=1.1.0
pkgrel=1
pkgdesc='Tiny LessPass API server client CLI to get passwords and site settings'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rlpcli'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('c5fa2ee2d79ebfa60c0d026596853b06f71bc9f7527453d98075c7c284b69b52d719ec209864de55a98b921c49b642298a276f964fc31e3a10c532affd166c61')

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
