# Maintainer: Foxma <foxma at fermentedfox dot co dot uk>

pkgname=mixing-station
pkgver=2.6.5
pkgrel=1
pkgdesc='Mixer remote control for multiple mixers'
arch=('any')
url='https://mixingstation.app/'
license=('custom:proprietary')
depends=('jre11-openjdk' 'zenity')
replaces=('mixing-station-pc' 'mixing-station-pc-bin')
conflicts=('mixing-station-pc' 'mixing-station-pc-bin')
source=(
  "$pkgname-$pkgver-$pkgrel.zip::https://mixingstation.app/backend/api/web/download/update/mixing-station-pc/release"
  'mixing-station'
  'copyright.txt'
  'ms-icon.png::https://mixingstation.app/ms-docs/assets/ms.png'
  'mixing-station.desktop')
sha256sums=(
  SKIP                                                               # release.zip
  '2bf580819e9ddb5183d7d1a260ed50e759339038fc767c5a065333d7aebb46f9' # mixing-station
  'a5d350e62b37f9394944421d94aaa1a823f396a0e76727cb37898029bc5d77bf' # copyright.txt
  '2a9b5fedbaf45ff7c7822b9cfc6dd50541b68ca39545611814f034608c2f9a00' # ms-icon.png
  '0ebe311c4f614552cab7bacd4d5b67677ab2d09a89ceb49d10cb8f05c06297f7' # mixing-station.desktop
)
package() {
  # Java Script
  install -m 0755 -d "$pkgdir/usr/share/java/mixing-station"
  install -m 0644 "mixing-station-desktop.jar" "$pkgdir/usr/share/java/mixing-station/mixing-station.jar"

  # Shell wrapper
  install -m 0755 -d "$pkgdir/usr/bin"
  install -m 0755 "mixing-station" "$pkgdir/usr/bin/mixing-station"

  # Backward compactibility
  install -m 0755 "mixing-station" "$pkgdir/usr/bin/mixing-station-pc"

  # License
  install -m 0755 -d "$pkgdir/usr/share/licenses/mixing-station"
  install -m 0644 "copyright.txt" "$pkgdir/usr/share/licenses/mixing-station/copyright.txt"

  # Icon
  install -m 0755 -d "$pkgdir/usr/share/mixing-station"
  install -m 0644 "ms-icon.png" "$pkgdir/usr/share/mixing-station/icon.png"

  # Desktop
  install -m 0755 -d "$pkgdir/usr/share/applications/"
  install -m 0644 "mixing-station.desktop" "$pkgdir/usr/share/applications/mixing-station.desktop"
}
