# Maintainer: Peter Hoeg <first name at last name dot com>

pkgname=glpi
pkgver=0.85.5
pkgrel=1
pkgdesc="GLPI Inventory Management"
arch=('any')
url=('http://www.glpi-project.org')
source=("https://forge.glpi-project.org/attachments/download/2093/glpi-${pkgver}.tar.gz"
        'glpi.service')
license=('GPL')
options=(!strip)
depends=(nginx mysql php)
sha256sums=('6dee0ca3dc01f0aece2b91302c42e790749f02c0a3603d20385da9b663474309'
            '2df019c2eada4bf8a31ee3fbb77e25f1e15882129bea19ebaabfbdddce8131b3')

package() {
  _base=$pkgdir/usr/share/webapps/glpi
  cd $srcdir/glpi || exit
  mkdir -p \
        $pkgdir/usr/lib/systemd/user \
        $pkgdir/usr/share/doc/glpi \
        $_base

  cp $srcdir/glpi.service $pkgdir/usr/lib/systemd/user

  mv *.txt $pkgdir/usr/share/doc/glpi
  cp -r * $_base

  find $pkgdir -type d | xargs chmod 755
  find $pkgdir -type f | xargs chmod 644

  find $_base/{files,config} -type d | xargs chmod 777
  find $_base -name '*.sh' | xargs chmod 755
}
