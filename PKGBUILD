# Maintainer: novica <nnovica@gmail.com>

pkgname=rv
pkgver=0.22.0 # renovate: datasource=github-tags depName=a2-ai/rv
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

sha512sums=('0df7644d3e25b084a5245f79ceda28bd03b37118ae3d4608a70bc1eb9b9e1b7f5dfd8f8fcf1b192d189893a479775672e2daca4d8b2d1b43fbcb49a2aded7e8e')
