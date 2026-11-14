# Maintainer: qwlp <https://github.com/qwlp>
pkgname=omapdf-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='Native Wayland PDF and EPUB reader built with GPUI and MuPDF (portable binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/qwlp/omapdf'
license=('GPL-3.0-or-later' 'AGPL-3.0-only')
depends=('glibc>=2.39' 'gcc-libs' 'vulkan-icd-loader' 'fontconfig')
optdepends=('xdg-desktop-portal: desktop file chooser integration')
provides=("omapdf=$pkgver")
conflicts=('omapdf')
options=('!strip' '!debug')
source=("omapdf-${pkgver}.tar.gz::$url/archive/refs/tags/v0.0.2.tar.gz")
sha256sums=('235e4311844d35ef8d7f4bfe23a2ce59ba0a2a5abb1e5486897b4c49747f2849')
source_x86_64=("omapdf-${pkgver}-x86_64::$url/releases/download/v0.0.2/omapdf-linux-x86_64")
sha256sums_x86_64=('82df0bd5adf6e4644e2ce24d7d3853e5f99ebd6272510ffb7dfc224cf0f20fed')
source_aarch64=("omapdf-${pkgver}-aarch64::$url/releases/download/v0.0.2/omapdf-linux-aarch64")
sha256sums_aarch64=('a01602ddd727456e5ab349aa65ea70c98ae1ca60116795ee59ef7f89114e8a78')
noextract=("omapdf-${pkgver}-x86_64" "omapdf-${pkgver}-aarch64")

package() {
  install -Dm755 "omapdf-${pkgver}-${CARCH}" "$pkgdir/usr/bin/omapdf"
  cd omapdf-0.0.2
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
