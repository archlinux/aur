# Maintainer: novica <nnovica@gmail.com>

pkgname=rv
pkgver=0.23.2 # renovate: datasource=github-tags depName=a2-ai/rv
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

sha512sums=('88b5171bacb9dff70fe9d5a944175bd7b2e1cb926a2c002d532befa1bf2dfb09eee9e9ee8cd4088991e3cc9aaa9c8397dbaf3f719147ea5735117a45bcbdf6b0')
