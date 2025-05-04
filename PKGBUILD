# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rlpcli
pkgver=1.3.3
pkgrel=1
pkgdesc='Tiny LessPass API server client CLI to get passwords and site settings'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/rlpcli'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('ccfb387648672ed4ec17fde11f1de0a04a787313cb939a76d20b0bb0ecf3a66ca101c973651639e15162842f57d0fc54af9e0305aeb87909f61f7954008652c7')

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
