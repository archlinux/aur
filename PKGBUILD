# Maintainer: OGIOS <ogios@foxmail.com>
_pkgname=way-edges
pkgname=way-edges-git
pkgver=r446.337b9e8
pkgrel=1
pkgdesc="Hidden widget on screen edges"
arch=('x86_64' 'aarch64')
url="https://github.com/way-edges/way-edges"
license=('MIT')

provides=(way-edges)
conflicts=("$_pkgname"-bin)

depends=(
  'cairo'
  'wayland'
  'libpulse'
)
optdepends=(
  'hyprland: A C++ Compositor'
  'niri: A Rust Compositor based on smithay'
)
makedepends=(cargo git)

source=("git+$url.git")
options=(!debug)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # printf "%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  RUSTFLAGS="--cfg tokio_unstable" cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
