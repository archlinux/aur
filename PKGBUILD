# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: prettyvanilla, rabyte, Marcin Skory

pkgname=alephone-infinity
pkgver=20221126
pkgrel=1
pkgdesc="Marathon Infinity scenario data files for Aleph One"
arch=('any')
url="https://alephone.lhowon.org/"
license=('custom')
depends=('alephone')
source=("https://github.com/Aleph-One-Marathon/alephone/releases/download/release-$pkgver/MarathonInfinity-$pkgver-Data.zip"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('e85927ead6109bf101ea790c281146639e8ba108262f05ed1ad47178a81cae82'
            '5ec43ca790491113335cc0f22abc2acbf204d9d3551a1b45e41f157753ee826b'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            '9f0fa2edac76cf9a5d1a4b6c97bdfc040831fb4401f8626be85a0170ec756b25')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon Infinity" "$pkgdir"/usr/share/AlephOne/scenarios/infinity

  # sane permissions
  find "$pkgdir"/usr/share/AlephOne/scenarios/infinity -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
