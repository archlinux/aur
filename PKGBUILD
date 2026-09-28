# Maintainer: Blip Studio Inc. <hello@blip.net>
pkgname=blipnet
pkgver=1.2.3
pkgrel=1
pkgdesc='Send files to people and devices around the world'
arch=('x86_64' 'aarch64')
url='https://blip.net'
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libx11')
options=('!strip' '!debug')
source_x86_64=("https://static.blip.net/linux/blip-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://static.blip.net/linux/blip-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('6734e84294f128ac7db3b0ad0499e9996f84b20a5aa9836415b7370dcb7e610b')
sha256sums_aarch64=('3c582de658eff85fcbe9301b78774b862dc22f40401d777458d2126ac3f1c4a9')

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
