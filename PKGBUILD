# Maintainer: Blip Studio Inc. <hello@blip.net>
pkgname=blipnet
pkgver=1.2.2
pkgrel=1
pkgdesc='Send files to people and devices around the world'
arch=('x86_64' 'aarch64')
url='https://blip.net'
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libx11')
options=('!strip' '!debug')
source_x86_64=("https://static.blip.net/linux/blip-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://static.blip.net/linux/blip-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('0dcb662b4279b94f7913efa3177c5c9a1f0f3431b9089411165f5fafb2309cf4')
sha256sums_aarch64=('38283f68e5c382f04d5a5bfb91f1cc849680ad1b437c7d4b9411f219129f0bae')

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
