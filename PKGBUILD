# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='git-x'
pkgver=1.1.0
pkgrel=2
pkgdesc='CLI extensions for Git that simplify common workflows'
url='https://github.com/simeg/git-x'
license=('MIT')
makedepends=('cargo')
depends=('git')
arch=('x86_64' 'i686')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('dac2f14a3f515d7be0793bdede677fcfabbae86429fbc61cc0df39521437589c')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./docs/*
}

