pkgname=sehx-git
_pkgname=sehx
pkgver=0.1.3.r0.gaf6111d
pkgrel=1
pkgdesc='SEnsible HeXadecimal, the ASCII-synergetic little-endian hexadecimal format'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/sehx-rs'
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
