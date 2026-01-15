# Maintainer: MeIsGaming <info@meisgaming.net>
pkgname=windowpet-git
pkgver=r101.aba8d3a
pkgrel=1
pkgdesc="WindowPet desktop overlay application (Git Version)"
arch=('x86_64')
url="https://github.com/SeakMengs/WindowPet"
license=('MIT')
maintainer="MeIsGaming <info@meisgaming.net>"
depends=('sfml2' 'libx11' 'libxrandr' 'nodejs' 'yarn')
makedepends=('git' 'cmake' 'nodejs' 'yarn' 'rustup' 'rust' 'cargo')
provides=('windowpet')
conflicts=('windowpet')

source=("git+https://github.com/SeakMengs/WindowPet.git"
        "https://raw.githubusercontent.com/MeIsGaming/windowpet-pkgbuild/refs/heads/main/windowpet.desktop")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/WindowPet"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/WindowPet/src-tauri"

  # Build frontend + Rust (Tauri)
  export CARGO_BUILD_JOBS=$(nproc)
  rustup default stable
  cargo build --release
}

package() {
  cd "$srcdir/WindowPet"

  install -Dm755 "src-tauri/target/release/window_pet" "$pkgdir/usr/bin/windowpet"

  install -Dm644 "windowpet.desktop" "$pkgdir/usr/share/applications/windowpet.desktop"

}
