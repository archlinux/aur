# Maintainer: Blip Studio Inc. <hello@blip.net>
pkgname=blipnet
pkgver=1.2.8
pkgrel=1
pkgdesc='Send files to people and devices around the world'
arch=('x86_64' 'aarch64')
url='https://blip.net'
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libx11')
options=('!strip' '!debug')
source_x86_64=("https://static.blip.net/linux/blip-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://static.blip.net/linux/blip-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('59fd1020f7f193aae4373f45f39bf39e9e3337bf0af6ede91bdb1c8e4c1ac463')
sha256sums_aarch64=('7e9fb6607435cebcd9c1f54e1b94a18e9eaed79031cf1b4b79fbfca4793f6ec8')

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
