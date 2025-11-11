# Maintainer: Alexander Karpukhin <thealexdev23@gmail.com>

pkgname=power-options-webview-git
pkgver=1.2.2r17.b62549
pkgrel=1
pkgdesc="A Web Renderer frontend for Power Options, a blazingly fast power management solution."
arch=('x86_64')
url=https://github.com/thealexdev23/power-options
license=('MIT')

depends=('power-options-daemon-git' 'webkit2gtk' 'xdotool')
makedepends=('cargo' 'dioxus-cli' 'git')

provides=('power-options-webview')
conflicts=('power-options-webview')

source=("git+https://github.com/thealexdev23/power-options.git")
sha256sums=('SKIP')

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/power-options/crates/frontend-webview"
  dx build --release
}

package() {
  cd "$srcdir/power-options"

  install -Dm755 "target/release/frontend" "$pkgdir/usr/bin/power-options-webview"

  mkdir -p "$pkgdir/usr/lib/power-options-webview/"
  cp -r "crates/frontend-webview/assets" "$pkgdir/usr/lib/power-options-webview/"

  install -Dm755 "icon.png" "$pkgdir/usr/share/icons/power-options-webview.png"

  install -Dm755 "install/power-options-webview.desktop" "$pkgdir/usr/share/applications/power-options-webview.desktop"
}
