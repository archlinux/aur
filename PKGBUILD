# Maintainer: novica <nnovica@gmail.com>

pkgname=ry
pkgver=0.11.0 # renovate: datasource=github-tags depName=sims1253/ry
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

sha512sums=('dc08a23f4c4cc61c92535e4e9a60f862654fec54ec3c12b902589a0b463d7124d6167b3465a92916e98f99fd0c74ab23595af1c5f3c42fd41253b3fb0bf6eff5')
