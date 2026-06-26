pkgname=pingall
pkgver=2.1.7
pkgrel=1
pkgdesc='Ping everything you can reach'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/pingall'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'iputils')
makedepends=('cargo')
optdepends=('avahi: hostname resolution with avahi-resolve')
conflicts=('pingall-bin' 'pingall-git')
_cratename='pingall'
source=("${_cratename}-${pkgver}.crate::https://static.crates.io/crates/${_cratename}/${_cratename}-${pkgver}.crate")
sha256sums=('b058cce581ea9a91f49a45f86725da899ddeebbd6b4f33f510b2121155ed1e06')

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
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
