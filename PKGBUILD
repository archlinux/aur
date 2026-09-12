# Maintainer: novica <nnovica@gmail.com>

pkgname=raven
pkgver=0.20.2 # renovate: datasource=github-tags depName=jbearak/raven
pkgrel=1
pkgdesc="Static analyzer for R — a language server in your editor, a checker in CI"
url="https://github.com/jbearak/raven"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=(
    libgcc
    glibc
)
conflicts=('raven-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jbearak/raven/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked -p raven
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/raven"  "${pkgdir}/usr/bin/raven"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

sha512sums=('c99c0e4f682cfe2333f94dc9b9d1b8a9c422c13888b357e6e60f9060c2636ac6047536534bacae603f5c146e8d0e532c1ee396157e6e5e55e7071b6851363c13')
