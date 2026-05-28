pkgname=aodv
pkgver=0.2.2
pkgrel=1
pkgdesc='Userspace AODV control-plane implementation based on RFC 3561'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/aodv-rs'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('aodv-bin' 'aodv-git')
_cratename='aodv'
_binname='aodv'
source=("${_cratename}-${pkgver}.crate::https://static.crates.io/crates/${_cratename}/${_cratename}-${pkgver}.crate")
sha256sums=('63e13ff80fa47673aec419fd242e08cc6a3f9e176bada65025be45647748954d')

prepare() {
  cd "${_cratename}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${_cratename}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release --locked --all-features
}

package() {
  cd "${_cratename}-${pkgver}"
  install -Dm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${pkgname}"
}
