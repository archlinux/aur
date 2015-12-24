# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=railroadrampage
pkgver=1.2
pkgrel=4
pkgdesc="an action tower defence-type game"
arch=('any')
url="http://neotron-games.blogspot.com/"
license=("custom:unknown")
install="railroadrampage.install"
source=("https://dl.dropboxusercontent.com/u/29095940/oss/RailroadRampage_Linux_${pkgver}.zip" "railroadrampage.desktop")
md5sums=('da592c555ebf2c1c890f4ac443896794'
         '3eb28b43b6984d3158d2443c8603aabd')
depends=('bennugd-core' 'bennugd-modules')

package() {
  mkdir -p $pkgdir/usr/{share/railroadrampage,bin}
  cd $srcdir/RailroadRampage_Linux
  /bin/tar cf - --exclude=bgdruntime --exclude=RailroadRampage.sh --exclude=RailroadRampage.dcb * | ( cd $pkgdir/usr/share/railroadrampage/; tar xfp - )
  # fix file permissions (zip does not preserve those)
  find $pkgdir/usr/share/railroadrampage -type f -print0 | xargs -0 chmod 644
  echo "#!/bin/sh
cd /usr/share/railroadrampage
/usr/bin/bgdc RailroadRampage.prg
/usr/bin/bgdi RailroadRampage.dcb" > $pkgdir/usr/bin/railroadrampage
  chmod 755 $pkgdir/usr/bin/railroadrampage
  install -D -m644 $srcdir/RailroadRampage_Linux/RailroadRampage.png $pkgdir/usr/share/pixmaps/railroadrampage.png && \
  install -D -m644 $srcdir/railroadrampage.desktop $pkgdir/usr/share/applications/railroadrampage.desktop
}
