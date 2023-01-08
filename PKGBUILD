# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rlpcli
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI helper to get paswords and site settings directly from a LessPass server'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/rlpcli'
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('e79cbc1e245d395ebb06c90556a9dae366bd0c91b8020abc27fe18c3382e43bb168a9d474f32fe959a09bf0798c0f598473f72d43e6f8ab0efec7c450c656feb')

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
