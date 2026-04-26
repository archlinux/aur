# PKGBUILD (converted from hyprviz-bin)
pkgname=hyprviz
pkgver=0.9.0
pkgrel=1
pkgdesc="GUI for configuring Hyprland!"
url="https://github.com/timasoft/hyprviz"
license=("("GPL-2.0")")
arch=("x86_64" "aarch64")
depends=(gtk4 glib2 desktop-file-utils hyprland)
makedepends=("cargo" "rust" "pkgconf" "pkg-config" "clang")
provides=("$pkgname")
conflicts=("hyprviz-bin")
source=("https://github.com/timasoft/hyprviz/archive/refs/tags/v0.9.0.tar.gz")
sha256sums=('d1817d067b1015d2a7e18712b4a689f9ec351b80189b449684c61762fa461d3b')

build() {
  cd "${srcdir}/hyprviz-0.9.0"

  export CC=clang
  export CXX=clang++

  cargo build --release --locked
}

package() {
  cd "${srcdir}/hyprviz-0.9.0"
  
  # Binary
  install -Dm755 "target/release/hyprviz" "${pkgdir}/usr/bin/hyprviz"
  
  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/hyprviz/LICENSE"
  
  # Desktop entry (check both possible names)
  if [ -f "hyprviz.desktop" ]; then
    install -Dm644 "hyprviz.desktop" "${pkgdir}/usr/share/applications/hyprviz.desktop"
  elif [ -f "hyprviz.desktop" ]; then
    install -Dm644 "hyprviz.desktop" "${pkgdir}/usr/share/applications/hyprviz.desktop"
  fi
  
  # Icons — installed from extracted source archive (assets/ is in the tarball)
  if [ -f "assets/hyprviz.svg" ]; then
    install -Dm644 "assets/hyprviz.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprviz.svg"
  fi
  if [ -f "assets/hyprviz.png" ]; then
    install -Dm644 "assets/hyprviz.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/hyprviz.png"
  fi
}
# Maintainer: timasoft <tima.klester@yandex.ru>
