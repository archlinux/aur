# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread
pkgver=0.1.3
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
sha256sums=('99825ce265b0ea2f526c2b86fcc9371d2b98eecab06b2a5c1eb14a59b396c99a')

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
