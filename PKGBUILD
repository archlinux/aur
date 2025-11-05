# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: prettyvanilla, Christoph Zeiler, Marcin Skory, Mitchel Humpherys

pkgname=alephone-marathon
pkgver=20250829
pkgrel=1
pkgdesc="Marathon 1 scenario data files for Aleph One"
arch=('any')
url="https://alephone.lhowon.org/"
license=('custom')
depends=('alephone')
source=("https://github.com/Aleph-One-Marathon/alephone/releases/download/release-$pkgver/Marathon-$pkgver-Data.zip"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('644fa202a8df19fd5c36b8c4bc3777c33afd291e2874669defc1819d8e132620'
            'b26bd186919c8e3ee3950e29054b3b932e8881e7a443a3854e97d692a72bb022'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            '65c3e36b3fa89a39e76861dc36f61786c924723e6c53fd0ec486b8b4bd21e5df')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r Marathon "$pkgdir"/usr/share/AlephOne/scenarios/marathon

  # sane permissions
  find "$pkgdir"/usr/share/AlephOne/scenarios/marathon -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
