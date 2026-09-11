# Maintainer: novica <nnovica@gmail.com>

pkgname=rpx
pkgver=2.0.0 # renovate: datasource=github-tags depName=scalerail-solutions/rpx
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

sha512sums=('e96f0b7b4acfd9d2c4c5648ce177e5ec04ab212cec033a82d58f8d9b831d9ffcd24c0891747959a011260e769bb85fc36c1e7dabbe3aafb92ec4fa4a9254fe7d')
