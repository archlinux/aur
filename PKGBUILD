# Maintainer: novica <nnovica@gmail.com>

pkgname=rpx
pkgver=2.1.1 # renovate: datasource=github-releases depName=scalerail-solutions/rpx
pkgrel=1
pkgdesc="A performant package manager for R"
url="https://github.com/scalerail-solutions/rpx"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    glibc
    libgcc
)
conflicts=('rpx-bin')
optdepends=()
makedepends=('rust' 'cmake' 'nasm')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scalerail-solutions/rpx/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/rpx "${pkgdir}/usr/bin/rpx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('c55dc670edfb803a00215303319b736603deb530bf685cf4699075ee12c35f84a0370de0c28f6f01c23ae36ede4d6e5c8989193c64ad3ae5d8f515f3214550f9')
