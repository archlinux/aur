pkgname=tiny-ping
_cratename='tiny-ping'
_binname='tiny-ping'
pkgver=0.7.1
pkgrel=1
pkgdesc='Small Asynchronous ICMP library and CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/tiny-ping'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('tiny-ping-bin' 'tiny-ping-git')
source=("${_cratename}-${pkgver}.crate::https://static.crates.io/crates/${_cratename}/${_cratename}-${pkgver}.crate")
sha256sums=('53562e86678aa49f067ed3ad0841c13a5303d6b1a5586ba2a8d75d85df7cbb12')

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
