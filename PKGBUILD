pkgname=tiny-ping-git
_pkgname=tiny-ping
_binname='tiny-ping'
pkgver=0.7.1.r0.ga1d7e59
pkgrel=1
pkgdesc='Small Asynchronous ICMP library and CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/tiny-ping'
license=('MIT')
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
  cargo fetch --locked
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release --locked --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${_pkgname}"
}
