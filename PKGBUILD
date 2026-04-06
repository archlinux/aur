# Maintainer: novica <nnovica@gmail.com>

pkgname=uvr
pkgver=0.2.2
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

sha512sums=('87fbe0437c8cafa928ddc4e3bbf83bbbedf8dec970566ce463b68355ba9920fb5cb067c5ce5a8ba6b58b0988fdf4c0e1f3e24a68eadb1eb36c66bea1b7ebf461')
