# Maintainer: Carwyn Nelson <carwyn at hey dot com>
pkgname=yambar-hyprland-wses
pkgver=0.2.0_alpha.1
pkgrel=3
pkgdesc="Enable Yambar to show Hyprland workspaces"
arch=('x86_64')
url="https://github.com/jonhoo/yambar-hyprland-wses"
license=('MIT', 'Apache-2.0')
depends=()
makedepends=('cargo')
# source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/jonhoo/$pkgname/archive/refs/tags/${pkgver//_/-}.tar.gz")
source=("$pkgname-$pkver.tar.gz::https://github.com/jonhoo/yambar-hyprland-wses/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('6934c2b3d8666d58e600e0d9690d252fa9787e414f915b8a7572e4d37c49caf9')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "$pkgname-${pkgver//_/-}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-${pkgver//_/-}"

  cargo build --release --locked
}

check() {
  cd "$pkgname-${pkgver//_/-}"

  cargo test --release --locked
}

package() {
  cd "$pkgname-${pkgver//_/-}"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
