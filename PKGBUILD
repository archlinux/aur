# Maintainer: qwlp <https://github.com/qwlp>
pkgname=omapdf-bin
pkgver=0.0.4
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
source=("omapdf-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('09ed7b0c733e1254d1bae7cd1bf6c4ace813d53b0600b5a338f76de7170e5d8b')
source_x86_64=("omapdf-${pkgver}-x86_64::$url/releases/download/v${pkgver}/omapdf-linux-x86_64")
sha256sums_x86_64=('344eac36d59ecade68bdf45295fbcd616f05e58e0450024f46b231d4c03d01eb')
source_aarch64=("omapdf-${pkgver}-aarch64::$url/releases/download/v${pkgver}/omapdf-linux-aarch64")
sha256sums_aarch64=('faa222884cc1164516977935ba747e0628961505c9905d5c6b347787d551a4a2')
noextract=("omapdf-${pkgver}-x86_64" "omapdf-${pkgver}-aarch64")

package() {
  install -Dm755 "omapdf-${pkgver}-${CARCH}" "$pkgdir/usr/bin/omapdf"
  cd "omapdf-${pkgver}"
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
