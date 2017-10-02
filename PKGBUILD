# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Luis Medina <noxein@yahoo.com>

pkgname=alephone-evil
pkgver=1.0
pkgrel=3
pkgdesc="A radical new scenario for the Aleph One engine"
arch=('any')
url="http://trilogyrelease.bungie.org/"
license=('unknown')
depends=('alephone')
source=("http://files3.bungie.org/trilogy/MarathonEvil.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('25ade4be0e9f0a4456511830e1abf55f48a095390bae8cef02a16771e5fad122'
            '73a27f33ab234dc96bf63105d6f8b98a730247ff7611d682b967173e7bdb2466'
            '68247e727749dcf17439fc98b92f9ad6a86ff795e3f5859ec6a3c4bdd174805c')

prepare() {
  # delete leftover
  rm -rf "Marathon EVIL"/Themes/Default/CVS
}

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon EVIL" "$pkgdir"/usr/share/AlephOne/scenarios/evil

  # sane permissions
  find "$pkgdir"/usr/share/AlephOne/scenarios/evil -type f -exec chmod 644 {} \;

  # launcher script and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
