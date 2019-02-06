# Maintainer: Mathias Bastholm <mbastholm at gmail dot com>
pkgname=moo
pkgver=2.0.0.2
pkgrel=1
pkgdesc='Master of Orion is a turn-based, 4X science fiction strategy game'
arch=('any')
url='https://www.gog.com/game/master_of_orion_1_2'
license=('custom')
depends=('dosbox')
makedepends=('lgogdownloader')
source=("gog_master_of_orion_${pkgver}.sh::gogdownloader://master_of_orion_classic/en3installer1"
        'moo'
        'moo.desktop')
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
options=('!strip')
sha512sums=('40565687db81402d731c662e050494344d1c65395fc8c5bfd6c369676a19a66996305a1933994a158c02f78edf4b1e95534f318c854088b7d843cb9454891ae1'
            'be7c19eb7a09ff063fb1f941e3c10a65d741d01ee99a53543971f29d5d18be99e43f0f38ccf8381f39f06b6609de4a9404ddab735907320c22a73fa81e37d4c6'
            '8223565f92e51e37eb7f8d43a82d9a9c7edce3bd88611c2e4ece32dc16d15622b90bff8797eb21788e49e390e2abcdc7b33efe3f1e217d43bb56bb525a05cc4a')

package() {
  install -d -m755 $pkgdir/usr/share
  cp -r data/noarch/data $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share -type f -exec chmod 644 "{}" \;
  find $pkgdir/usr/share -type d -exec chmod 755 "{}" \;

  install -Dm755 moo $pkgdir/usr/bin/moo
  install -Dm644 data/noarch/support/icon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/moo.png
  install -Dm644 moo.desktop $pkgdir/usr/share/applications/moo.desktop
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
