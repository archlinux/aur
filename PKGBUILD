# Maintainer: novica <nnovica@gmail.com>

pkgname=okr
pkgver=0.1.10 # renovate: datasource=github-tags depName=nanxstats/okr
pkgrel=1
pkgdesc="Reproducible R source context for coding agents"
url="https://github.com/nanxstats/okr"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('okr-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanxstats/okr/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/okr"  "${pkgdir}/usr/bin/okr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('bf5120e94081f5c477a7245207a485465f81e2c98aff3f5ac3199c11bcab94b977ce4ad103d83e651a3ef1ad62c026bf1dbea2aff0341e1510cd1a9a0661d4cf')
