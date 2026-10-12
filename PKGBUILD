# Maintainer: Blip Studio Inc. <hello@blip.net>
pkgname=blipnet
pkgver=1.2.6
pkgrel=1
pkgdesc='Send files to people and devices around the world'
arch=('x86_64' 'aarch64')
url='https://blip.net'
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libx11')
options=('!strip' '!debug')
source_x86_64=("https://static.blip.net/linux/blip-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://static.blip.net/linux/blip-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('a88a700e77d58988dc3b1f9ebd38c65782140187a1f17f6a1281b4ab43f5f3df')
sha256sums_aarch64=('0147913600e0b63ab20a39973fc572536a903bbc6f8ee60877a04ea2216eba32')

package() {
  cd "$srcdir/blip-$pkgver"

  install -d "$pkgdir/opt/blip"
  cp -r bin lib "$pkgdir/opt/blip/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/blip/bin/blip "$pkgdir/usr/bin/blip"

  install -d "$pkgdir/usr"
  cp -r share "$pkgdir/usr/"

  install -Dm644 lib/app/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  find "$pkgdir/usr/share" -type f -exec chmod 644 {} +
  find "$pkgdir/usr/share" -type d -exec chmod 755 {} +
}
