# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: rabyte <rabyte__gmail>

pkgname=alephone-eternalx
pkgver=1.1.0b4
pkgrel=1
pkgdesc="A free scenario for Aleph One that continues the story of the Marathon trilogy"
arch=('any')
url="http://eternal.bungie.org/"
license=('unknown')
depends=('alephone')
source=("http://eternal.bungie.org/files/_releases/EternalXv${pkgver//./}Full.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('d60caee357b59399dd9225895a3c6a5d76d68a75250afa48be113da1e23d4e6d'
            'c627fdd3812a04d4de4a0249c5c560ba1089559fb0dfd0307192c6dc908c3d06'
            '729ea2e7a90a92a55fd47eae1568df72172f393370ceeabee657b378c663ec43')
noextract=("EternalXv${pkgver//./}Full.zip")

prepare() {
  # circumvent bsdtar error and ignore Mac OS metadata
  unzip -qo "EternalXv${pkgver//./}Full.zip" -x */.DS_Store __MACOSX/* -d eternalx
}

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/alephone/scenarios
  cp -r eternalx "$pkgdir"/usr/share/alephone/scenarios/eternalx

  # sane permissions
  find "$pkgdir"/usr/share/alephone/scenarios/eternalx -type f -exec chmod 644 {} \;

  # launcher script and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
