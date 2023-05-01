# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread
pkgver=0.1.1
pkgrel=1
pkgdesc='Multi-Monitor Wallpaper Utility'
arch=('x86_64')
url='https://github.com/0xk1f0/rwpspread'
license=('GPL3')
depends=('wpaperd')
makedepends=('cargo' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9654d1fb20b2d68ba2e04b77d36de3d690e9c1baf6bdfc7239d7de102e4fe386')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
