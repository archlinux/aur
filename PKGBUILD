# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_pkgname='lyrical'
pkgname="${_pkgname}"
pkgver=0.4.4
pkgrel=1
pkgdesc='A rust tool to display synced lyrics in your waybar (or any other bar)!'
arch=('x86_64')
url='https://github.com/tblelrd/lyrical'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'playerctl')
makedepends=('cargo')
provides=('lyrical')
conflicts=('lyrical')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('14aeaa11c094f315a8dd56212625ebdcf6e171eaa10c319e827cfa5e421ab3b4')

prepare() {
  cd "${_pkgsrc}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
  cd "${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${_pkgsrc}"

  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE' 
}
