# Maintainer: Mathias Bastholm <mbastholm at gmail dot com>
pkgname=gog-moo-ii
pkgver=2.0.0.6
pkgrel=1
pkgdesc='Master of Orion II: Battle at Antares is a 4X turn-based strategy game set in space'
arch=('any')
url='https://www.gog.com/game/master_of_orion_1_2'
license=('custom')
depends=('dosbox')
makedepends=('lgogdownloader')
source=("gog_master_of_orion_2_${pkgver}.sh::gogdownloader://master_of_orion_2/en3installer1"
        'http://www.moo2mod.com/patch/MOO2-1.50.13.zip'
        'moo-ii'
        'gog-moo-ii.desktop')
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
options=('!strip')
sha512sums=('2a972b3d8db04f2f52cfae64b8b2e041d0fb2b0084103f35814db123daf5d530e6309e2fe364fe5435d26e893cedcb2592efcb4deb90cd7b1445173e92f82a0b'
            'b02480a1eb05b2b93671478f0ada974e20852533e31fabea826e4d32214db5e44267275351743e3efc510fc0d33540e88fdb34b91ae301098ff19b2d38d6fb88'
            '736286b71b2bb3cfd39316d4f46cb3584011e6ab0446225f31fbe52cafa121dea9e9d801038010ea54cc1a94319e91f98002363db19590b5dd456cde4848eedd'
            '27142d7d2f7c0c7d5fd7c042461bf20211188f84bdc54a8fbd95c5a6f8227f6825a702918f89ab07578afde16c4884dadd30fa87ba6bba3896b01515f1879729')

package() {
  install -d -m755 $pkgdir/usr/share
  # Copy over base game
  cp -r data/noarch/data $pkgdir/usr/share/$pkgname
  # Copy over 1.50 patch
  cp -r MOO2-1.50.13/MOO2.1.50.13/* $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share -type f -exec chmod 644 "{}" \;
  find $pkgdir/usr/share -type d -exec chmod 755 "{}" \;

  install -Dm755 ${pkgname#gog-} $pkgdir/usr/bin/${pkgname#gog-}
  install -Dm644 data/noarch/support/icon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
