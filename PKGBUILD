# Maintainer: 3m44n <notximan@proton.me>
pkgname=islet
pkgver=0.1.0
pkgrel=1
pkgdesc="Dynamic Island / Floating Media HUD for wlroots and Smithay Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/3m44n/iSLET"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'libadwaita' 'pipewire' 'wireplumber')
makedepends=('cargo' 'git' 'pkgconf')
provides=('islet')
conflicts=('islet-git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-targets
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/islet" "$pkgdir/usr/bin/islet"
  install -Dm755 "target/release/islet-ctl" "$pkgdir/usr/bin/islet-ctl"
  install -Dm644 "packaging/islet.service" "$pkgdir/usr/lib/systemd/user/islet.service"
  install -Dm644 "packaging/dev.islet.Overlay.desktop" "$pkgdir/usr/share/applications/dev.islet.Overlay.desktop"
  install -Dm644 "assets/style.css" "$pkgdir/usr/share/islet/style.css"
  install -Dm644 "assets/theme-catppuccin-mocha.css" "$pkgdir/usr/share/islet/themes/catppuccin-mocha.css"
  install -Dm644 "assets/theme-dark-glass.css" "$pkgdir/usr/share/islet/themes/dark-glass.css"
}
