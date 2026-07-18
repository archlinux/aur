# Maintainer: Viktor Varenik <yavarenikya@gmail.com>

_pkgname=panium
pkgname=${_pkgname}-git
_gitname=panium
pkgver=0.1.0.r5.d4b34e7
pkgrel=1
pkgdesc='Lightweight, oxidized zoom and pan utility for Wayland compositors.'
url='https://github.com/kotleni/panium'
license=('GPL-2.0')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('panium::git+https://github.com/kotleni/panium')
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  _version=$(cat Cargo.toml | grep -e "^version = " | sed -E 's/version = "([0-9\.]+)".*/\1/')
  _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "${_version}.${_revision}"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $_gitname
    cargo build --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_gitname/target/release/$_pkgname"
}
