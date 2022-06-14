# Maintainer: Simon <contact at swz dot works>
pkgname=rlbotgui-rust-git
git_pkgname=rlbot_gui_rust
cargo_pkgname=rlbot_gui
pkgver=0.1.0.54c351f
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
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-parse --short HEAD)"
}
