# Maintainer: novica <nnovica@gmail.com>

pkgname=raven
pkgver=0.20.3 # renovate: datasource=github-tags depName=jbearak/raven
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

sha512sums=('9ae8dbb5e875d63335bc7b8cf96587a91c0d790c6b791656b967ff4d7f1c3f28d84ca636ce9467fbda3bcd207b318103763bbf31253ea3b781f9abcbdfccf905')
