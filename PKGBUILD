pkgname=rmatrix
_cratename='r-matrix'
_binname='r-matrix'
pkgver=2.0.6
pkgrel=1
pkgdesc='Rust port of cmatrix'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/rmatrix'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('rmatrix-bin' 'rmatrix-git')
source=("${_cratename}-${pkgver}.crate::https://static.crates.io/crates/${_cratename}/${_cratename}-${pkgver}.crate")
sha256sums=('e97e2cfbe34312b492ee09bf844086c2cde0e60d49885e50a5b18572a903ad30')

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
