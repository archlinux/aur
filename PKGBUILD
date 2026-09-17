# Maintainer: Blip Studio Inc. <hello@blip.net>
pkgname=blipnet
pkgver=1.2.0
pkgrel=1
pkgdesc='Send files to people and devices around the world'
arch=('x86_64' 'aarch64')
url='https://blip.net'
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libx11')
options=('!strip' '!debug')
source_x86_64=("https://static.blip.net/linux/blip-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://static.blip.net/linux/blip-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('c8fdb2910b59d6cc0984162b665902127528e28c47c01719c04af17e6e836340')
sha256sums_aarch64=('ff445c02a4edca8e89298ce2d45f120a6795feaba108ae5d2fca72a5d875fa41')

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
