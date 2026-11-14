# Maintainer: qwlp <https://github.com/qwlp>
pkgname=omapdf-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='Native Wayland PDF and EPUB reader built with GPUI and MuPDF (portable binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/qwlp/omapdf'
license=('GPL-3.0-or-later' 'AGPL-3.0-only')
depends=('glibc>=2.39' 'gcc-libs' 'wayland' 'vulkan-icd-loader' 'fontconfig')
optdepends=('xdg-desktop-portal: desktop file chooser integration')
provides=("omapdf=$pkgver")
conflicts=('omapdf')
options=('!strip' '!debug')
source=("omapdf-${pkgver}.tar.gz::$url/archive/refs/tags/v0.0.3.tar.gz")
sha256sums=('ece3299f10485cdf9d1ffaaf405c89b54509a3d75b90ac7bbaa85c249081510d')
source_x86_64=("omapdf-${pkgver}-x86_64::$url/releases/download/v0.0.3/omapdf-linux-x86_64")
sha256sums_x86_64=('ecbd90761b85cb8a24ea0619763f22cfaffb7a3596cd9897a95ef3c653085d20')
source_aarch64=("omapdf-${pkgver}-aarch64::$url/releases/download/v0.0.3/omapdf-linux-aarch64")
sha256sums_aarch64=('492ca88310c0da22e9c4e3134e4f17dc4daa70d4ac84fb5d871a613ec1c3f012')
noextract=("omapdf-${pkgver}-x86_64" "omapdf-${pkgver}-aarch64")

package() {
  install -Dm755 "omapdf-${pkgver}-${CARCH}" "$pkgdir/usr/bin/omapdf"
  cd omapdf-0.0.3
  install -Dm644 assets/io.omapdf.desktop "$pkgdir/usr/share/applications/io.omapdf.desktop"
  sed -i 's|Exec=omapdf %f|Exec=/usr/bin/omapdf %f|; s|TryExec=omapdf|TryExec=/usr/bin/omapdf|' \
    "$pkgdir/usr/share/applications/io.omapdf.desktop"
  install -Dm644 assets/icons/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.omapdf.svg"
  install -Dm644 assets/icons/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.omapdf.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY.md"
  install -Dm644 assets/AGPL-3.0.txt "$pkgdir/usr/share/licenses/$pkgname/MUPDF-AGPL-3.0"
  install -Dm644 assets/icons/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LUCIDE-LICENSE"
  install -Dm644 assets/fonts/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/FONT-OFL"
  install -Dm644 assets/fonts/Noto-OFL.txt "$pkgdir/usr/share/licenses/$pkgname/NOTO-OFL"
  install -Dm644 assets/fonts/Droid-NOTICE "$pkgdir/usr/share/licenses/$pkgname/DROID-NOTICE"
}
