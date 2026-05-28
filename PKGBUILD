pkgname=proverbilo-git
_pkgname=proverbilo
pkgver=0.1.9.r0.gc5fea7d
pkgrel=1
pkgdesc='Programo por montri hazardajn proverbojn en Esperanto'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/proverbilo'
license=('GPL-3.0-or-later')
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
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
