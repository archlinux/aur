# Maintainer: psic4t <psic4t@data.haus>
pkgname=rimg
pkgver=1.0.0
pkgrel=1
pkgdesc='Minimal Wayland image viewer with vim keybindings'
arch=('x86_64')
url='https://github.com/psic4t/rimg'
license=('GPL-3.0-or-later')
depends=(
  'wayland'
  'libxkbcommon'
  'libjpeg-turbo'
  'libpng'
  'giflib'
  'libwebp'
  'libtiff'
  'librsvg'
  'cairo'
  'glib2'
  'libavif'
  'libheif'
  'libjxl'
)
makedepends=(
  'rust'
  'cargo'
  'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b795a2ac6955e5743f6903366dfe6dc5a9a16a9a2f89dfdb571e75f99c657ead')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
