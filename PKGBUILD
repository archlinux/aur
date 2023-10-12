# Maintainer: crolbar <crolbar@crolbar.com>
_pkgname="crolk"
pkgname="crolk-git"
pkgver=1.0
pkgrel=1
pkgdesc="Simple gui clock, stopwatch, timer, alarm made with gtk-rs"
arch=('x86_64')
url="https://github.com/crolbar/crolk"
license=('GPL3')
makedepends=(git cargo)
provides=('crolk')
optdepends=('dracula-icons-git: tray icon')
source=("git+$url")
md5sums=('SKIP')
prepare() {
    cd "${srcdir}/${_pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release 
}

package() {
  cd "${_pkgname}"
  install -Dm644 -t "$pkgdir/usr/share/applications"  "resources/crolk.desktop"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}