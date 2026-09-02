# Maintainer: Ilham Setiawan <me@ilhamset.id>

# Check for new releases at: https://github.com/luxury-yacht/app/releases

pkgname=luxury-yacht-bin
pkgver=2.1.1
pkgrel=2
pkgdesc="Cross-platform GUI desktop app for managing Kubernetes clusters"
arch=('x86_64' 'aarch64')
url="https://luxury-yacht.app"
license=('GPL-3.0-only')
depends=('gtk4' 'webkitgtk-6.0')
provides=('luxury-yacht')
conflicts=('luxury-yacht')
options=('!strip' '!debug' '!emptydirs')
source_x86_64=("https://github.com/luxury-yacht/app/releases/download/v${pkgver}/luxury-yacht_v${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/luxury-yacht/app/releases/download/v${pkgver}/luxury-yacht_v${pkgver}_linux_arm64.deb")
source=("LICENSE::https://raw.githubusercontent.com/luxury-yacht/app/v${pkgver}/LICENSE")
sha256sums=('f817886ee6bb65ed3098a7987b1e9781653d15c71f85589ce0d2af663c66d373')
sha256sums_x86_64=('0c0c41eb2d864b547045a3ffc8677ad4cc3bbc0f360887346955ab7a1ce065aa')
sha256sums_aarch64=('8a0356d667cf4e910d157cc9061cf9998e5d77170056f423c34e68c6375845b8')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir/"

  # Move binary to /usr/bin (Arch FHS; the .deb ships it under /usr/local/bin)
  install -Dm755 "$pkgdir/usr/local/bin/luxury-yacht" "$pkgdir/usr/bin/luxury-yacht"
  rm -rf "$pkgdir/usr/local"

  # Fix the desktop entry's Exec path to match /usr/bin
  sed -i 's|/usr/local/bin/|/usr/bin/|' "$pkgdir/usr/share/applications/luxury-yacht.desktop"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
