# Maintainer: novica <nnovica@gmail.com>

pkgname=ry
pkgver=0.12.0 # renovate: datasource=github-releases depName=sims1253/ry
pkgrel=1
pkgdesc="A fast static checker for the R language, written in Rust"
url="https://github.com/sims1253/ry"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('ry-bin')
optdepends=()
makedepends=('rust' 'git')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sims1253/ry/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked -p ry-cli
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/ry"  "${pkgdir}/usr/bin/ry"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('5a0b091b776944bb6b7352d082907f0248aa92f053ab108039be1f88805da2110883cdee44acf6c318957ad99fdae365adbde0be1f232681d1af109149ced3e0')
