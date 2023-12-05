#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2154
# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>

pkgname='aoc-cli'
pkgver='0.12.0'
pkgrel='1'
pkgdesc='Advent of Code command-line tool'
arch=('x86_64')
url="https://github.com/scarvalhojr/${pkgname}"
license=('MIT')
makedepends=('cargo')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/scarvalhojr/aoc-cli/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5bd2eef8a310564c122be34ea9116967fe887ea549146adf38f4fbb0cddc0539')


prepare ()
{
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build ()
{
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check ()
{
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package () {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-cli}"
}
