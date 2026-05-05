# Maintainer: zwielichtig <zwielichtig@users.noreply.github.com>
pkgname=zorg
pkgver=1.4.0
pkgrel=1
pkgdesc='A TUI SSH connection manager and orchestrator'
arch=('x86_64')
url='https://github.com/Zwielichtig/zorg'
license=('GPL-3.0-only')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
provides=('zorg')
conflicts=('zorg-bin')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Zwielichtig/zorg/archive/refs/tags/zorg-v1.4.0-proxyjump-part-2.tar.gz"
)
b2sums=(
  '6c7a749bfc1198c54b4b71daf7056817188e05e80f87042e053c1ff821f9d3cf9596653a3d55f815b94eb4a02aac6be532a26eac3a20afdadac6455ba78f9d82'
)

prepare() {
  cd "zorg-zorg-v1.4.0-proxyjump-part-2"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "zorg-zorg-v1.4.0-proxyjump-part-2"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "zorg-zorg-v1.4.0-proxyjump-part-2"
  install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
