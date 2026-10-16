# Maintainer: tiziodcaio <d dot bass05 at pm dot me>
# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamav-gui
pkgver=1.5.0
pkgrel=1
pkgdesc="Graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
arch=('x86_64')
url="https://github.com/wusel1007/clamav-gui"
license=(GPL-3.0-or-later)
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-translations' 'clamav' 'desktop-file-utils')
makedepends=('git' 'cmake' 'qt6-tools')
source=("git+https://github.com/wusel1007/clamav-gui.git#tag=v${pkgver}"
        )
sha256sums=('c2ca6c252511694aa68a78977c0ddc75f0aa030690ca03a8c597979089bba68e')


build() {
  local cmake_options=(
    -B build
    -S $pkgname
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # install -Dm644 "$pkgname-$pkgver/extra/ClamAV-GUI.desktop" "${pkgdir}/etc/xdg/autostart/ClamAV-GUI.desktop"
}
