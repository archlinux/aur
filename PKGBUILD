# Maintainer: Astrophagus <ocr12@duck.com>
pkgname=lockin-today-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A minimalistic pomodoro app built in Tauri and deno: With task tracker, focus music and focus timer"
arch=('x86_64')
url="https://github.com/purplehippo911/lockin-today"
license=('MIT')
groups=()
depends=('glibc' 'webkit2gtk-4.1' 'gtk3') # Tauri runtime
makedepends=('rust' 'rustup' 'cargo' 'deno' 'tauri-cli') # Build deps
checkdepends=()
optdepends=()
provides=()
conflicts=('lockin-today-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/purplehippo911/lockin-today.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "lockin-today"
}

build() {
	cd "lockin-today" 
  export CARGO_HOME="$PWD/cargo-home"
  rustup toolchain install stable
  deno install
  deno task tauri build
}

package() {
	cd "lockin-today"
  install -Dm755 "src-tauri/target/release/lockin-today" "$pkgdir/usr/bin/lockin-today"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/lockin-today.png" 2>/dev/null || true
install -Dm644 "lockin-today.desktop" "$pkgdir/usr/share/applications/lockin-today.desktop"
}
