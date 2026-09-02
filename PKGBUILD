# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=mdsh
pkgdesc='A markdown shell pre-processor'
pkgver=0.9.2
pkgrel=1
url='https://github.com/zimbatm/mdsh'
arch=(aarch64 x86_64)
license=('MIT')
makedepends=('cargo')
depends=('glibc' 'libgcc')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7d34e4870c1ad55f59011fb95927dc7c07a4571f61d0f61abeffcfbde5bfed8af80970c7d0bb9920e808a67b6898391e485df87f55b703530a00f019e9fce10d')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_STRIP=false
  cargo build --frozen --all-features --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vD -t "${pkgdir}/usr/bin" -m755 target/release/mdsh
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
