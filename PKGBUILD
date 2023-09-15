#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2154
# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname='dutree'
pkgver='0.2.18'
pkgrel='3'
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url='https://github.com/nachoparker/dutree'
license=('GPL3')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('55c30e57cc339dd16141510af33245cc3b82f588f22419fc034f02b36ebecba0')

prepare ()
{
  cd "${pkgname}-${pkgver}" || exit
  export RUSTUP_TOOLCHAIN='stable'
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build ()
{
  cd "${pkgname}-${pkgver}" || exit
  export RUSTUP_TOOLCHAIN='stable'
  export CARGO_TARGET_DIR='target'
  cargo build --frozen --release --all-features
}

check ()
{
  cd "${pkgname}-${pkgver}" || exit
  export RUSTUP_TOOLCHAIN='stable'
  cargo test --frozen --all-features
}

package ()
{
  cd "${pkgname}-${pkgver}" || exit
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
