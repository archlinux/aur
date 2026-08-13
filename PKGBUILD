# Maintainer: novica <nnovica@gmail.com>

pkgname=ir
pkgver=0.4.0 # renovate: datasource=github-tags depName=r-lib/ir
pkgrel=1
pkgdesc="Run standalone R scripts from embedded dependency metadata"
url="https://github.com/r-lib/ir"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('ir-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/ir/archive/v${pkgver}.tar.gz")

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
  install -Dm755 target/release/ir "${pkgdir}/usr/bin/ir"
  install -Dm755 target/release/rx "${pkgdir}/usr/bin/rx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('27843584a3881c3b9c3498e1b21db2afae75d9f577ff6658646a8d318fcc822416cfe74a54cadaebf76d850e1d4b255f325a8b36d178a7a689380f573b8be103')
