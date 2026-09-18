# Maintainer: novica <nnovica@gmail.com>

pkgname=rv
pkgver=0.23.1 # renovate: datasource=github-tags depName=a2-ai/rv
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

sha512sums=('49d8362c4f59b5a24585d5cf25a9b72f9510c2e49bdc5be02a6d960add6eabe72cc85f078fcfdeb69a61762c78adfcbf5aabec5bee63bec4924be90fcb25f07d')
