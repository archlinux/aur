# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-gtk-git
pkgver=0.1.0r12.9e8f71
pkgrel=1
pkgdesc="A gtk frontend for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')
conflicts=('power-options-gtk')
depends=('power-options-daemon-git')
makedepends=('cargo')
source=("git+https://github.com/thealexdev23/power-options.git")
sha256sums=('SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/frontend-gtk"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/frontend-gtk"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/power-options"

  install -Dm755 "target/release/frontend-gtk" "$pkgdir/usr/bin/power-options-gtk"
  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/power-options.png"
  install -Dm755 "install/power-options-gtk.desktop" "$pkgdir/usr/share/applications/power-options-gtk.desktop"
}
