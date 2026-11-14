# Maintainer: Coobyk <mail@coobyk.com>
pkgname=mca-selector-rs-git
_pkgname=mca-selector
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="A faithful Rust + GPUI port of MCA Selector (latest git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Coobyk/mca-selector-rs"
license=('MIT')
depends=('fontconfig' 'libxcb' 'libxkbcommon' 'wayland' 'alsa-lib')
makedepends=('git' 'cargo' 'pkgconf' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd mca-selector-rs
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mca-selector-rs
  cargo build --release --locked -p "$_pkgname"
}

package() {
  cd mca-selector-rs
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
