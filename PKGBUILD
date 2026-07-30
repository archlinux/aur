# Maintainer: Ilham Setiawan <me@ilhamset.id>

# Check for new releases at: https://github.com/luxury-yacht/app/releases

pkgname=luxury-yacht-bin
pkgver=1.11.2
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
sha256sums_x86_64=('66faf5114d53d02c0cc424825b10652e02b0f01187039990e9d8d49c9dcefbeb')
sha256sums_aarch64=('b55e5d41e9037cbac3339814d42dc81d8383f6f4ca2fd6b589a84d3246e0c1f3')

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
