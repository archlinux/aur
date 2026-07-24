# Maintainer: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamav-gui
pkgver=1.4.1
pkgrel=1
pkgdesc="Graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
arch=('x86_64')
url="https://github.com/wusel1007/clamav-gui"
license=(GPL-3.0-or-later)
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-tools' 'qt6-translations' 'clamav' 'desktop-file-utils')
source=("clamav-gui-${pkgver}.tar.gz::https://github.com/wusel1007/clamav-gui/archive/refs/tags/v${pkgver}.tar.gz"
        )
sha256sums=('40e10d4f352a833e924c63728af3114c424377bc9b2e64599ae50aa39acdb77b')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # install -Dm644 "$pkgname-$pkgver/extra/ClamAV-GUI.desktop" "${pkgdir}/etc/xdg/autostart/ClamAV-GUI.desktop"
}
