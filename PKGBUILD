pkgname=sehx
pkgver=0.1.3
pkgrel=1
pkgdesc='SEnsible HeXadecimal, the ASCII-synergetic little-endian hexadecimal format'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/sehx-rs'
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('sehx-bin' 'sehx-git')
_cratename='sehx'
source=("${_cratename}-${pkgver}.crate::https://static.crates.io/crates/${_cratename}/${_cratename}-${pkgver}.crate")
sha256sums=('d11da1c71e36310a3a05645e816bd72bd004baa66e6565e9f8e92f777a68f27c')

prepare() {
  cd "${_cratename}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch
}

build() {
  cd "${_cratename}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release
}

package() {
  cd "${_cratename}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
