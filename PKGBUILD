# Maintainer: Ilham Setiawan <me@ilhamset.id>

# Check for new releases at: https://github.com/luxury-yacht/app/releases

pkgname=luxury-yacht-bin
pkgver=1.11.1
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
sha256sums_x86_64=('0ed0eca4f10c35122d7fae07023549f8d9a67e6894a14c3fb6764f1f50297a13')
sha256sums_aarch64=('9b832ded0c77adc0ee9acd3b29eb0f78a0526f82429535fd55429f7aaaa64398')

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
