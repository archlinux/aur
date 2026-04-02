# Maintainer: Ersin Can Karaca <canersinkaraca@gmail.com>
pkgname=lapse
pkgver=0.1.0.r15.g87a29af # Bu kısım pkgver() ile otomatik güncellenecek
pkgrel=1
pkgdesc="Native screen recording application in Rust for Wayland/X11"
arch=('x86_64')
url="https://github.com/canersin/lapse"
license=('custom')
depends=('gtk3' 'wayland')
makedepends=('cargo' 'git')
provides=("lapse")
conflicts=("lapse")
source=("git+https://github.com/canersin/lapse.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/lapse"
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lapse"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/lapse"
  # Binary
  install -Dm755 "target/release/lapse" "$pkgdir/usr/bin/lapse"
  # Desktop file
  install -Dm644 "assets/lapse.desktop" "$pkgdir/usr/share/applications/lapse.desktop"
  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  # EĞER ikonun varsa (örneğin assets/icon.png):
  # install -Dm644 "assets/icon.png" "$pkgdir/usr/share/pixmaps/lapse.png"
}
