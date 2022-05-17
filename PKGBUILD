# Maintainer: Simon <contact@swz.works>
pkgname=rlbotgui-rust-git
git_pkgname=rlbot_gui_rust
cargo_pkgname=rlbot_gui
pkgver=0.1.0.55dc73b
pkgrel=1
pkgdesc="A Rust GUI for the RLBot framework"
arch=("x86_64")
url="https://github.com/VirxEC/rlbot_gui_rust"
replaces=("rlbot-gui-rust-git")

depends=("python")
makedepends=("cargo" "git" "sed")

license=("custom")

source=("git+https://github.com/VirxEC/rlbot_gui_rust")
sha512sums=(SKIP)

build() {
  cd "$srcdir/$git_pkgname/tauri-src"
  cargo build --release --target-dir target
}

package() {
  cd "$srcdir/$git_pkgname/tauri-src"

  install -Dm755 target/release/$cargo_pkgname "${pkgdir}/usr/bin/$cargo_pkgname"
}

pkgver() {
  cd "$srcdir/$git_pkgname/tauri-src"
  echo "$(cargo pkgid | sed "s/^.*://").$(git rev-parse --short HEAD)"
}
