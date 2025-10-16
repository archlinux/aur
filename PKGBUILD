# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tobin Little <tobinlittle72@gmail.com>
pkgname=iio-niri
pkgver=1.2.1
pkgrel=1
pkgdesc="Listen to iio-sensor-proxy and updates Niri output orientation depending on the accelerometer orientation."
arch=("x86_64")
url="https://github.com/Zhaith-Izaliel/iio-niri"
license=('MIT')
depends=(
  dbus
  iio-sensor-proxy
  niri
)
makedepends=(
  rust
  pkgconf
)
optdepends=()
conflicts=()
options=()
install=
changelog=
source=("https://github.com/Zhaith-Izaliel/iio-niri/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
