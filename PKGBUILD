pkgname=rimilo
pkgver=0.2.8
pkgrel=1
pkgdesc='Rapida rimvort-serĉilo por Esperanto-angla vortaro'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/rimilo'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('rimilo-bin' 'rimilo-git')
_cratename='rimilo'
source=("${_cratename}-${pkgver}.crate::https://static.crates.io/crates/${_cratename}/${_cratename}-${pkgver}.crate")
sha256sums=('a46274daf4f628bf477157f8d0ff71326bd9f7d8843cfd1d28375670855701ae')

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
