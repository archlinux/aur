# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rlpcli
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI helper to get paswords and site settings directly from a LessPass server'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/rlpcli'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('99abe4d9d15623ef5f53d4f4e5432a3964705f614e2610e61e22a4f751da6f05ef25d97f827b7020fa6dda2666b70f94a4471bba83f7e1202a5f4ca2415c61e9')

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
