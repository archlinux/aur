# Maintainer: novica <nnovica@gmail.com>

pkgname=raven
pkgver=0.24.0 # renovate: datasource=github-releases depName=jbearak/raven
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

sha512sums=('b9b0c4cd4066e128a781cdf98cca77bd18328e682ae409d9fae45a8b9bbd9a01fc29b60393bcb333f48a1910265258bf316824542b4d7f5688f4011ca83767d9')
