# Maintainer: Mathias Bastholm <mbastholm at gmail dot com>
pkgname=gog-moo
pkgver=2.0.0.2
pkgrel=2
pkgdesc='Master of Orion is a turn-based, 4X science fiction strategy game'
arch=('any')
url='https://www.gog.com/game/master_of_orion_1_2'
license=('custom')
depends=('dosbox')
makedepends=('lgogdownloader')
source=("gog_master_of_orion_${pkgver}.sh::gogdownloader://master_of_orion_classic/en3installer1"
        'moo'
        'gog-moo.desktop')
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
options=('!strip')
sha512sums=('40565687db81402d731c662e050494344d1c65395fc8c5bfd6c369676a19a66996305a1933994a158c02f78edf4b1e95534f318c854088b7d843cb9454891ae1'
            'af3d9225016751574bfb5ed9d44768c9da1f53e0d40f882b6e1445264faea91979e9911702f061c41a68464a2e9db89debc75e611ba88b611311f18260320fac'
            '0d24e393dbe87d649f2a19190f70b1b8c78540e837ba855e89cfd39f15268fbd624db6df22c4829a18e45f388a4a25d73bed1a1bd1f57f56bc36309895239ba8')

package() {
  install -d -m755 $pkgdir/usr/share
  cp -r data/noarch/data $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share -type f -exec chmod 644 "{}" \;
  find $pkgdir/usr/share -type d -exec chmod 755 "{}" \;

  install -Dm755 ${pkgname#gog-} $pkgdir/usr/bin/${pkgname#gog-}
  install -Dm644 data/noarch/support/icon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
