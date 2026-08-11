# Maintainer: novica <nnovica@gmail.com>

pkgname=rpx
pkgver=1.7.0 # renovate: datasource=github-tags depName=scalerail-solutions/rpx
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

sha512sums=('149239eb17eee90bcdd06cac6d35074d8faa394196ff6eb60856ccb5779a1d7f79b5169f7a17cebbaea51a09798bda3d786b31d0c4774cc260209757ef6ca92f')
