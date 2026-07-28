# Maintainer: novica <nnovica@gmail.com>

pkgname=uvr
pkgver=0.4.3 # renovate: datasource=github-tags depName=nbafrank/uvr
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

sha512sums=('30ccd1ff2f4194f9bd42238678608a32bb330fcca7bdf415f3f6cc12fc4708048aa8527b7af4dba4885cce1e77d30e1239cbf511bfc5e507313d733fe4d8fa09')
