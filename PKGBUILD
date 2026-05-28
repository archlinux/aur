pkgname=pingall
pkgver=2.1.5
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
sha256sums=('37faf36b0acb588c225b0508836661d7224c5a0ea1b4067e7648973dad7350ae')

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
