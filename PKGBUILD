# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=totp-rs
_pkgname=totp
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI tool for generating TOTP codes.'
url='https://github.com/kotarac/totp'
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
options=(!lto)
source=("https://github.com/kotarac/totp/archive/v${pkgver}.tar.gz")
sha256sums=('49e1d2befd1cb4b802c44a29a7f624f58efdb8beeb94d5c53edb08dfd793d051')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-features
}

package() {
  install -m755 -D "${srcdir}/${_pkgname}-${pkgver}/target/release/totp" "${pkgdir}/usr/bin/totp"
  install -m644 -D "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
