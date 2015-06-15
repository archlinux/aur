# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=puzsion
pkgver=1
pkgrel=2
pkgdesc="a little bejeweled-like game"
arch=('any')
url="http://www.gp32x.com/board/index.php?/topic/52332-wiz-bennugdgph-contest-winners/page__p__823581"
license="custom:unknown"
install="puzsion.install"
source=("http://betatester.bennugd.org/contest-2009-bennugd-wiz/Wiz/PUZSION%20(hokutoy).zip" "puzsion.desktop")
md5sums=('3df808edaec385285609c1179ab03c4d'
         'dc1ce1453069244df465f6ee0bb51619')
depends=('bennugd-core' 'bennugd-modules')

package() {
  mkdir -p $pkgdir/usr/{share/puzsion,bin}
  cd $srcdir/puzsion
  cp -r * $pkgdir/usr/share/puzsion
  find $pkgdir/usr/share/puzsion -type f \( -name 'puzsion.dcb' -o -name 'Thumbs.db' -o -name 'puzsion*gpe' \) -exec rm '{}' \;
  # fix file permissions (zip does not preserve those)
  find $pkgdir/usr/share/puzsion -type f -print0 | xargs -0 chmod 644
  echo "#!/bin/sh
cd /usr/share/puzsion
/usr/bin/bgdc puzsion.prg
/usr/bin/bgdi puzsion.dcb" > $pkgdir/usr/bin/puzsion
  chmod 755 $pkgdir/usr/bin/puzsion
  install -D -m644 $srcdir/puzsion/puzsion.png $pkgdir/usr/share/pixmaps/puzsion.png
  install -D -m644 $srcdir/puzsion.desktop $pkgdir/usr/share/applications/puzsion.desktop
  rm $srcdir/puzsion/puzsion.png
}
