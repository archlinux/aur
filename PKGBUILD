# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=totp-rs
_pkgname=totp
pkgver=0.2.1
pkgrel=1
pkgdesc='CLI tool for generating TOTP codes.'
url='https://github.com/kotarac/totp'
source=("https://github.com/kotarac/totp/archive/v${pkgver}.tar.gz")
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
sha256sums=('4013145181626a56dc636fee45649df308fdba92da25e8cc8d5aa89ea4da29ea')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  cargo build --frozen --release --all-features
}

package() {
  install -m755 -D "${srcdir}/${_pkgname}-${pkgver}/target/release/totp" "${pkgdir}/usr/bin/totp"
  install -m644 -D "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
