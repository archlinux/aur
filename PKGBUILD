# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=puzsion
pkgver=1
pkgrel=1
pkgdesc="a little bejeweled-like game"
arch=('i686')
url="http://www.gp32x.com/board/index.php?/topic/52332-wiz-bennugdgph-contest-winners/page__p__823581"
license="custom:unknown"
install="puzsion.install"
source=("http://betatester.bennugd.org/contest-2009-bennugd-wiz/Wiz/PUZSION%20(hokutoy).zip" "puzsion.desktop")
md5sums=('3df808edaec385285609c1179ab03c4d'
         'dc1ce1453069244df465f6ee0bb51619')
depends=('bennugd-core' 'bennugd-modules')

build() {
  mkdir -p $pkgdir/usr/{share/puzsion,bin}
  cd $srcdir/puzsion
  /bin/tar cf - --exclude=bgdruntime --exclude=puzsion.dcb --exclude=Thumbs.db --exclude="puzsion*gpe" * | ( cd ../../pkg/usr/share/puzsion/; tar xfp - )
  # fix file permissions (zip does not preserve those)
  find $pkgdir/usr/share/puzsion -type f -print0 | xargs -0 chmod 644
  echo "#!/bin/sh
cd /usr/share/puzsion
/usr/bin/bgdc puzsion.prg
/usr/bin/bgdi puzsion.dcb" > $pkgdir/usr/bin/puzsion
  chmod 755 $pkgdir/usr/bin/puzsion
  install -D -m644 $srcdir/puzsion/puzsion.png $pkgdir/usr/share/pixmaps/puzsion.png && \
  install -D -m644 $srcdir/puzsion.desktop $pkgdir/usr/share/applications/puzsion.desktop || return 1
  rm $srcdir/puzsion/puzsion.png
}
