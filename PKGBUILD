# Maintainer: Ilham Setiawan <me@ilhamset.id>

# Check for new releases at: https://github.com/luxury-yacht/app/releases

pkgname=luxury-yacht-bin
pkgver=1.11.3
pkgrel=1
pkgdesc="Cross-platform GUI desktop app for managing Kubernetes clusters"
arch=('x86_64' 'aarch64')
url="https://luxury-yacht.app"
license=('GPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('luxury-yacht')
conflicts=('luxury-yacht')
options=('!strip' '!debug' '!emptydirs')
source_x86_64=("https://github.com/luxury-yacht/app/releases/download/v${pkgver}/luxury-yacht_v${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/luxury-yacht/app/releases/download/v${pkgver}/luxury-yacht_v${pkgver}_linux_arm64.deb")
source=("LICENSE::https://raw.githubusercontent.com/luxury-yacht/app/v${pkgver}/LICENSE")
sha256sums=('f817886ee6bb65ed3098a7987b1e9781653d15c71f85589ce0d2af663c66d373')
sha256sums_x86_64=('b51852182f16a9b1eb642f41d6fe648ba56843cd704a71769daf781ef78dee1e')
sha256sums_aarch64=('c0deca51698239c507862975426d610c145ed2750e0f21c4e3d5627bbe7dca13')

package() {
  bsdtar -xf data.tar.zst -C "$pkgdir/"

  # Move binary to /usr/bin (Arch FHS; the .deb ships it under /usr/local/bin)
  install -Dm755 "$pkgdir/usr/local/bin/luxury-yacht" "$pkgdir/usr/bin/luxury-yacht"
  rm -rf "$pkgdir/usr/local"

  # Fix the desktop entry's Exec path to match /usr/bin
  sed -i 's|/usr/local/bin/|/usr/bin/|' "$pkgdir/usr/share/applications/luxury-yacht.desktop"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
