pkgname=proverbilo
pkgver=0.1.8
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
sha256sums=('652498a582d3145a33fcf09aff9f92d57ad8a7aef5bb542c67f97eb2d8c59448')

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
