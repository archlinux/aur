# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=paip
pkgver=1.0.0
pkgrel=2
pkgdesc='like cat but through llm'
url='https://github.com/kotarac/paip'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(cargo)
options=(!lto)
source=("https://github.com/kotarac/paip/archive/v${pkgver}.tar.gz")
sha256sums=('64f9b24d5db808f645dd52aac11205ff9e63bbbaf545ca72c1c02b67426c548b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  install -m755 -D "${srcdir}/${pkgname}-${pkgver}/target/release/paip" "${pkgdir}/usr/bin/paip"
  install -m644 -D "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
