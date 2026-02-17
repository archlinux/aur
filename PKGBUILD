# PKGBUILD (converted from hyprviz-bin)
pkgname=hyprviz
pkgver=0.8.0
pkgrel=1
pkgdesc='GUI for configuring Hyprland!'
url='https://github.com/timasoft/hyprviz'
license=("GPL-2.0")
arch=("x86_64" "aarch64")
depends=(gtk4 glib2 desktop-file-utils hyprland )
makedepends=("cargo" "rust" "pkgconf" "pkg-config" "clang")
provides=("$pkgname")
conflicts=("hyprviz-bin")
source=("https://github.com/timasoft/hyprviz/archive/refs/tags/v0.8.0.tar.gz")
sha256sums=('83198008e4192b75a6b0463ef385255bc1558e66046b845d6ecee0ef9205f8e7')

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
