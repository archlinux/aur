# Maintainer: TNE <tne at garudalinux dot org>

pkgname=firefox-video-acceleration
pkgver=1.0.0
pkgrel=1
pkgdesc="Enable hardware accelerated video decoding on Firefox and Firefox-based browsers"
arch=('any')
url="https://aur.archlinux.org/packages/firefox-video-acceleration"
license=('GPL')
depends=("firefox-h264ify")
optdepends=('intel-media-driver: VA-API for modern intel GPUs'
            'libva-mesa-driver: VA-API for Nvidia (nouveau) and AMD GPUs')
source=("hardware-acceleration.js")
md5sums=('556f7d2c12345c8011217d30c1f86fb4')

package() {
  # Firefox
  install -d "$pkgdir"/usr/lib/firefox/browser/{defaults/preferences,extensions}
  install -Dm644 hardware-acceleration.js "$pkgdir"/usr/lib/firefox/browser/defaults/preferences/hardware-acceleration.js

  # Preferences and h264ify
  for b in firefox-developer-edition firedragon librewolf; do
    install -d "$pkgdir"/usr/lib/$b/browser/{defaults/preferences,extensions}
    ln -s /usr/lib/firefox/browser/defaults/preferences/hardware-acceleration.js "$pkgdir"/usr/lib/$b/browser/defaults/preferences/
    ln -s /usr/lib/firefox/browser/extensions/jid1-TSgSxBhncsPBWQ@jetpack.xpi "$pkgdir"/usr/lib/$b/browser/extensions/
  done
}
