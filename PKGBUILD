# Maintainer: Mahid Sheikh <mahidsheikh@proton.me>
#
# shellcheck disable=all
pkgname=ebou-git
pkgver=0.2.0.742.r14.g27ac6c8
pkgrel=1
pkgdesc="Mastodon Client Written in Rust!"
arch=(any)
url="https://github.com/terhechte/Ebou"
license=('GPL')
depends=(webkit2gtk-4.1 gtk3 xdotool libsoup gst-libav gst-plugins-base gst-plugins-good)
makedepends=(cargo)
source=('git+https://github.com/terhechte/Ebou.git')
sha256sums=('SKIP')

git_clone_name=Ebou

pkgver() {
  cd "$srcdir/$git_clone_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/$git_clone_name"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$git_clone_name"
  cargo build --frozen --release
}

package() { 
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$git_clone_name/target/release/ebou"
}
