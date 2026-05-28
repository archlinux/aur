pkgname=proverbilo
pkgver=0.1.9
pkgrel=1
pkgdesc='Programo por montri hazardajn proverbojn en Esperanto'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/proverbilo'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('proverbilo-bin' 'proverbilo-git')
_cratename='proverbilo'
source=("${_cratename}-${pkgver}.crate::https://static.crates.io/crates/${_cratename}/${_cratename}-${pkgver}.crate")
sha256sums=('7db4b95b9a639a5cbd4c35460e32f2468ca8380e0522a81a885b6c2cd398729d')

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
