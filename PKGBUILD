# Maintainer: novica <nnovica@gmail.com>

pkgname=rpx
pkgver=2.0.1 # renovate: datasource=github-tags depName=scalerail-solutions/rpx
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

sha512sums=('d97fc41910a248b3675246c4add26ff31963b87df73c11b1c673870d319be44c4e47bca73a1f7e5cf018a345e9358cf53b688ad27ddd90da98fac919063f6a07')
