# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread
pkgver=0.2.1
pkgrel=1
_patch=""
pkgdesc='Multi-Monitor Wallpaper Utility'
arch=('x86_64')
url='https://github.com/0xk1f0/rwpspread'
license=('GPL3')
makedepends=('cargo' 'git')
optdepends=('wpaperd: wallpaper setter backend'
            'swaybg: wallpaper setter backend')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('e34562c460fa99fac1d786720755f86755a2a666b75f7263cfd1fa6557d5ebd0671a6292bba1823c15d39c3be68b1800f87acf45f4bc15617bc5758ec23a53e8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
