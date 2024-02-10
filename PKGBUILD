# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=angryoxide
_pkgname=AngryOxide
pkgver=0.8.5
pkgrel=2
_patch=""
pkgdesc='802.11 Attack Tool'
arch=('x86_64')
url='https://github.com/Ragnt/AngryOxide'
license=('Unspecified')
makedepends=('cargo' 'git')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('49771e1026b784c53e0b0f1eac5bc1f2598967aa5538f9880932e9c2e02b6545651c25d573284a127bacaaeb91c12d4c6d7e78ff26ad6fbd32b6d98204c0b04a')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  # executable
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  # completion
  install -Dm0644 -t "${pkgdir}/usr/share/bash-completion/completions" "completions/${pkgname}"
}
