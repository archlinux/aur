# Maintainer: novica <nnovica@gmail.com>

pkgname=uvr
pkgver=0.4.8 # renovate: datasource=github-releases depName=nbafrank/uvr
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

sha512sums=('ea3d7b60783619f12b53a954f9de6d520fa889bc7aa6dab6f1fc71be6bac5b6f5c25a30e7345b710cff30540d1a0567c234320f66147b6e2474c9fd3578eda73')
