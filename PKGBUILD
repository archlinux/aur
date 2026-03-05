# Maintainer: Lia Bertran Roca <lia@bertran.xyz>

_pkgname=wstui
pkgname="${_pkgname}-git"
pkgver=0.0.1alpha1.r1.gd577a3c
pkgrel=1
pkgdesc='A terminal frontend for WhatsApp (development version)'
url="https://github.com/NullSeile/${_pkgname}"
license=('MIT')
arch=('x86_64')
depends=('chafa')
makedepends=('cargo' 'wayland' 'go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}
