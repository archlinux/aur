# Maintainer: Remco Stoeten <remcostoeten@hotmail.com>

pkgname=kuizer-bin
_pkgname=kuizer
pkgver=0.1.3
pkgrel=1
pkgdesc='Keyboard-driven disk cleanup for developers, with a terminal UI and a desktop app (release binaries)'
arch=('x86_64' 'aarch64')
url='https://kuizer.app'
license=('MIT')
depends=(
  'fontconfig'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'docker: clean dangling images, stopped containers and build cache'
  'git: pack repositories and delete merged branches'
  'xdg-utils: reveal items in the file manager'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_release="https://github.com/remcostoeten/kuizer/releases/download/v$pkgver"
_raw="https://raw.githubusercontent.com/remcostoeten/kuizer/v$pkgver/packaging"
source=(
  "$_pkgname-gui-32x32-$pkgver.png::$_raw/icons/32x32.png"
  "$_pkgname-gui-128x128-$pkgver.png::$_raw/icons/128x128.png"
  "$_pkgname-gui-256x256-$pkgver.png::$_raw/icons/256x256.png"
  "$_pkgname-gui-512x512-$pkgver.png::$_raw/icons/512x512.png"
)
source_x86_64=(
  "$_pkgname-x86_64-$pkgver.tar.xz::$_release/$_pkgname-x86_64-unknown-linux-gnu.tar.xz"
  "$_pkgname-gui-x86_64-$pkgver.tar.xz::$_release/$_pkgname-gui-x86_64-unknown-linux-gnu.tar.xz"
)
source_aarch64=(
  "$_pkgname-aarch64-$pkgver.tar.xz::$_release/$_pkgname-aarch64-unknown-linux-gnu.tar.xz"
  "$_pkgname-gui-aarch64-$pkgver.tar.xz::$_release/$_pkgname-gui-aarch64-unknown-linux-gnu.tar.xz"
)
sha256sums=('3aad078d1410bb022af434e89ec635561e858fc4a534dcd6efc502f40f987652'
            '201c3c26500ff9973bb1e2ea59b4746b1794249dd4142e9ed8c334d1d3a5c715'
            '66a7473a18ef95497c01907615eac1004b6114ee1d7e8fb49e9a899d4df94998'
            '7224e267d37d831ad4a4431b2ef5f1fa0364f6237b07024767ff8f1125094dee')
sha256sums_x86_64=('5d9152648418e24964e93bff3e2641f9c9d4b2bb30b3f2e7a7b18526062ee9d6'
                   'a7d018b707d3e44bc7995b5984898f61f065b27b3e8ad04a303af667b7dbb043')
sha256sums_aarch64=('9cbf9bb1c8073c73a4179d094c2079f9ec1f7fc076a3bb2084788dd15bbf2165'
                    '3260d7cc13944fa940d13e9fae131c7e6dd4e797c13abd0b91621ebf0ad1816a')

package() {
  local cli="$_pkgname-$CARCH-unknown-linux-gnu"
  local gui="$_pkgname-gui-$CARCH-unknown-linux-gnu"

  install -Dm755 "$cli/kuizer" "$pkgdir/usr/bin/kuizer"
  install -Dm755 "$gui/kuizer-gui" "$pkgdir/usr/bin/kuizer-gui"
  install -Dm644 "$gui/kuizer-gui.desktop" "$pkgdir/usr/share/applications/kuizer-gui.desktop"
  install -Dm644 "$gui/kuizer-gui.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/kuizer-gui.svg"
  for size in 32 128 256 512; do
    install -Dm644 "$_pkgname-gui-${size}x${size}-$pkgver.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kuizer-gui.png"
  done
  install -Dm644 "$cli/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$cli/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
