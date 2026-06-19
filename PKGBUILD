# Maintainer: novica <nnovica@gmail.com>

pkgname=uvr
pkgver=0.3.12
pkgrel=1
pkgdesc="An extremely fast R package and project manager"
url="https://github.com/nbafrank/uvr"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
    bzip2
    xz
)
conflicts=('uvr-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nbafrank/uvr/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/uvr"  "${pkgdir}/usr/bin/uvr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('e8c52008cebb777745d063cadde8f369a9ec02f1c0fcfbc825ee527214f2fcba91b3331a838079f507f8f58e6357c0758845f9b220d404f8dd2a29ccec290291')
