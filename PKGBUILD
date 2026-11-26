# Maintainer: qwlp <https://github.com/qwlp>
pkgname=omapdf-bin
pkgver=0.0.12
pkgrel=1
pkgdesc='Native Wayland and X11 PDF and EPUB reader built with GPUI and MuPDF (portable binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/qwlp/omapdf'
license=('GPL-3.0-or-later' 'AGPL-3.0-only')
depends=('glibc>=2.35' 'gcc-libs' 'libxcb' 'wayland' 'vulkan-icd-loader' 'fontconfig')
optdepends=('xdg-desktop-portal: desktop file chooser integration')
provides=("omapdf=$pkgver")
conflicts=('omapdf')
options=('!strip' '!debug')
source=("omapdf-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cacc4e4c368e0ecfa1696e61b6dbf788e3c42fa92919fbb5856ac9b3096cd56d')
source_x86_64=("omapdf-${pkgver}-x86_64::$url/releases/download/v${pkgver}/omapdf-linux-x86_64")
sha256sums_x86_64=('9338e88ccef8b773c05a24983fa1a71c7de2e91adc79f3d6ff7edcdeb59b6ca9')
source_aarch64=("omapdf-${pkgver}-aarch64::$url/releases/download/v${pkgver}/omapdf-linux-aarch64")
sha256sums_aarch64=('18c788f7defb0764f25e74734b3d409904fb87a05e72aed25b6b54e107598e92')
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
