# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rlpcli
pkgver=1.2.0
pkgrel=1
pkgdesc='Tiny LessPass API server client CLI to get passwords and site settings'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rlpcli'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('4e34642833469745b4b45ad93c3f728cc4cf9f02fe932b2f702ff107f081a7bdf724bf822857611d4a0f59a34c3c0784b439c2119b58065f6b4d68275c74490a')

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
