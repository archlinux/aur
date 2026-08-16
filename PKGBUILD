# Maintainer: tiziodcaio <d dot bass05 at pm dot me>
# Contributor: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamav-gui
pkgver=1.4.4
pkgrel=2
pkgdesc="Graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
arch=('x86_64')
url="https://github.com/wusel1007/clamav-gui"
license=(GPL-3.0-or-later)
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-translations' 'clamav' 'desktop-file-utils')
makedepends=('git' 'cmake' 'qt6-tools')
source=("git+https://github.com/wusel1007/clamav-gui.git#commit=24fa8b37e7da03d6e748135325e00e4bccd2691b"
        )
sha256sums=('44b4e222fd2476edc8d1fe5c2e5695dfc9d186847c67d7b06a8f26b27fe1d030')


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
