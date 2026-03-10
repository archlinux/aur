# PKGBUILD (converted from hyprviz-bin)
pkgname=hyprviz
pkgver=0.8.4
pkgrel=1
pkgdesc='GUI for configuring Hyprland!'
url='https://github.com/timasoft/hyprviz'
license=("GPL-2.0")
arch=("x86_64" "aarch64")
depends=(gtk4 glib2 desktop-file-utils hyprland )
makedepends=("cargo" "rust" "pkgconf" "pkg-config" "clang")
provides=("$pkgname")
conflicts=("hyprviz-bin")
source=("https://github.com/timasoft/hyprviz/archive/refs/tags/v0.8.4.tar.gz")
sha256sums=('2c878007b7b13a73981da4d737a3a341bcbe8d437b8524ef220ad430ce70fcc1')

build() {
  cd "${srcdir}/hyprviz-${pkgver}"

  export CC=clang
  export CXX=clang++

  cargo build --release --locked
}

package() {
  cd "${srcdir}/hyprviz-${pkgver}"
  install -Dm755 target/release/hyprviz "${pkgdir}/usr/bin/hyprviz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f "hyprviz.desktop" ]; then
    install -Dm644 "hyprviz.desktop" "${pkgdir}/usr/share/applications/hyprviz.desktop"
  elif [ -f "hyprviz.desktop" ]; then
    install -Dm644 "hyprviz.desktop" "${pkgdir}/usr/share/applications/hyprviz.desktop"
  fi
}
# Maintainer: timasoft <tima.klester@yandex.ru>
