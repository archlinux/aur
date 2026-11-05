# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
pkgname=vibrancegui-linux
pkgver=0.2.2
pkgrel=1
pkgdesc="Unofficial VibranceGUI-style vkSumi color profile manager for Linux"
arch=('x86_64')
url="https://github.com/NasirA1991/vibrancegui-linux"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'fontconfig'
  'libglvnd'
  'wayland'
  'libxkbcommon'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
  'libxinerama'
)
makedepends=('rust')
optdepends=(
  'vksumi: Vulkan color grading layer required to apply adjustments'
  'steam: Steam game library integration'
  'xdg-desktop-portal: native file picker for Add manually'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/vibrancegui-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e64968941b48c2ebb9a4c6e2a9a7fe284069c366b09f5283c5545933a28c5d78')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/vibrancegui "$pkgdir/usr/bin/vibrancegui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/vibrancegui.desktop "$pkgdir/usr/share/applications/vibrancegui.desktop"
  install -Dm644 packaging/vibrancegui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/vibrancegui.svg"
}
