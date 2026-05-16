#!/usr/bin/env bash

# Maintainer: Shobhit Parvan <shobhit.gdsc.ai@gmail.com>
# Maintainer: Shobhit Parvan <your-email@example.com>
pkgname=duplicates-analyzer
pkgver=1.0.0
pkgrel=1
pkgdesc="A sleek, multi-threaded GUI application to find and clean up duplicate files via MD5 hashes"
arch=('x86_64')
url="https://github.com/jodi42-shb/duplicates"
license=('custom:BSL 1.1')
depends=('gcc-libs' 'gtk3')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e91e0facd70f65071a764deb10b07ebc52ab345b1bc1dafc2e13f1cc145d9d5e')

prepare() {
  cd "${srcdir}/duplicates-"*
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/duplicates-"*
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/duplicates-"*

  install -Dm755 "target/release/duplicates" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "duplicates.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
