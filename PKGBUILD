# Maintainer: novica <nnovica@gmail.com>

pkgname=rv
pkgver=0.18.0
pkgrel=1
pkgdesc="A declarative R package manager"
url="https://github.com/a2-ai/rv"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('rv-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/a2-ai/rv/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked --features=cli
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/rv"  "${pkgdir}/usr/bin/rv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('6452ac1023a4129a7b0bd86aac6512f8ff25386e2480b4e897856b3e630d4b122421800cdd5de7799d961776955757eca264addea4cdbf26f59724016a02c222')
