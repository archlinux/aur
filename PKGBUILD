# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: Mitchel Humpherys <mitch.special@gmail.com>

pkgname=alephone-marathon
pkgver=20140104
pkgrel=1
pkgdesc="Marathon 1 scenario data files for Aleph One"
arch=('any')
url="http://marathon.sourceforge.net"
license=('custom')
depends=('alephone')
conflicts=('alephone-m1a1' 'alephone-highres')
replaces=('alephone-m1a1')
source=(Marathon-$pkgver-Data.zip::"http://marathon.sourceforge.net/download/data.php?game=marathon"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('9cbdcff88c1aa775799a8d52536003aab88f26e3938b694d60ec8543aee830f1'
            '64deb7f505ea1ec29e10037a2dcc297abed787b0ec4790d231bff6d08a0408d0'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            '49273db294ee0ba9f4b985a144969bae241877934b23d82a7de1522db705ee88')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/alephone/scenarios
  cp -r Marathon "$pkgdir"/usr/share/alephone/scenarios/marathon
  # sane permissions
  find "$pkgdir"/usr/share/alephone/scenarios/marathon -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
