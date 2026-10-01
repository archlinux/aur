# Maintainer: novica <nnovica@gmail.com>

pkgname=rpx
pkgver=2.1.0 # renovate: datasource=github-tags depName=scalerail-solutions/rpx
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

sha512sums=('b3a74727fc7bf6b82a0c786ef2d691832036e02faab50e0fd2f24348b5f320831d1126884ec18b0ba011871bdc3a664006fcce29a2a639a20ad22bbefac71d97')
