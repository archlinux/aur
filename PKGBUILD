# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: prettyvanilla, rabyte, Marcin Skory

pkgname=alephone-marathon2
pkgver=20230529
pkgrel=1
pkgdesc="Marathon 2 scenario data files for Aleph One"
arch=('any')
url="https://alephone.lhowon.org/"
license=('custom')
depends=('alephone')
source=("https://github.com/Aleph-One-Marathon/alephone/releases/download/release-$pkgver/Marathon2-$pkgver-Data.zip"
        "$pkgname.sh"
        "LICENSE" # TODO: clarify where this file comes from
        "$pkgname.desktop")
sha256sums=('f33b499b1b0d786eda025540a0ce1173a840ed53657748cf5becac567e0fae55'
            '21a58e60e6e3fd6f45a38c7ced637fc0a4a1fb40c897d25b53762e17b956a69b'
            '0dde70e490e4cb3e262ed7cc4f7ef6bdc49db557a14fc8674de38b2a9a426504'
            'ca9ce9efdc95f0b3bcf05ebbca0dd27348dcb073dc9866802737ad248efaf948')

package() {
  # scenario data
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Marathon 2" "$pkgdir"/usr/share/AlephOne/scenarios/marathon2

  # sane permissions
  find "$pkgdir"/usr/share/AlephOne/scenarios/marathon2 -type f -exec chmod 644 {} \;

  # launcher script, license and .desktop file
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
