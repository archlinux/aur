# Maintainer: faceless33
pkgname=cranamp
pkgver=0.1.86
pkgrel=1
pkgdesc='Music player in Rust with WSZ skins and an agent-connected Skin Studio'
arch=('x86_64' 'aarch64')
url='https://github.com/samoylenkodmitry/cranamp'
license=('Apache-2.0')
options=('!debug' '!lto')
depends=('alsa-lib' 'libgcc' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxi' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader')
optdepends=('vulkan-driver: GPU rendering' 'xdg-desktop-portal: file dialogs')
makedepends=('cargo' 'git' 'pkgconf')
source=("https://github.com/samoylenkodmitry/cranamp/releases/download/v$pkgver/cranamp-$pkgver-source.tar.gz")
sha256sums=('e4ada4b2b45a98a37232a378b3eca5b769c49adc50ee42cdff41c787f6ef385c')
prepare() {
  cd "cranamp-$pkgver"
  cargo fetch --locked
}
build() {
  cd "cranamp-$pkgver"
  cargo build --frozen --release --features store
}
package() {
  cd "cranamp-$pkgver"
  install -Dm755 target/release/cranamp "$pkgdir/usr/bin/cranamp"
  install -Dm644 platform/linux/io.cranamp.app.desktop "$pkgdir/usr/share/applications/io.cranamp.app.desktop"
  install -Dm644 assets/icon/icon-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.cranamp.app.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cranamp/LICENSE"
  install -Dm644 docs/third-party/THIRD-PARTY.html "$pkgdir/usr/share/licenses/cranamp/THIRD-PARTY.html"
  install -Dm644 docs/third-party/LiberationSans-OFL-1.1.txt "$pkgdir/usr/share/licenses/cranamp/LiberationSans-OFL-1.1.txt"
}
