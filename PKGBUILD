# Maintainer: Michael Straube <m.s.online gmx.de>

pkgname=froggix
pkgver=0.1
pkgrel=2
pkgdesc="A clone of the classic arcade game Frogger"
arch=('any')
license=('GPL3' 'custom')
url="https://sourceforge.net/projects/froggix"
depends=('python2-pygame')
source=("http://downloads.sourceforge.net/project/froggix/froggix/froggix%20$pkgver/Froggix.tar.gz")
sha1sums=('1e8bd04bd35c294f6108b302601243059a4fa59a')

prepare() {
  cd $pkgname
  printf '#!/bin/bash\ncd /usr/share/froggix\npython2 froggix.py\n' > froggix
}

package() {
  cd $pkgname
  install -d -m 755 "$pkgdir"/usr/share/froggix{,/data}
  install -m 644 froggix.py README "$pkgdir/usr/share/froggix/"
  install -m 644 data/* "$pkgdir/usr/share/froggix/data/"
  install -D -m 755 froggix "$pkgdir/usr/bin/froggix"
  install -D -m 644 Credits_and_Licenses "$pkgdir/usr/share/licenses/froggix/Credits_and_Licenses"
  chmod 666 "$pkgdir/usr/share/froggix/data/highscores.dat"
}
