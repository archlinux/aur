# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=airsonic
pkgver=10.1.1
pkgrel=2
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Airsonic/airsonic/"
license=('GPL3')
depends=('java-runtime-headless')
backup=('etc/airsonic/airsonic.conf')
noextract=(airsonic.war)
install=$pkgname.install
source=(https://github.com/airsonic/airsonic/releases/download/v${pkgver}/airsonic.war
        https://raw.githubusercontent.com/airsonic/airsonic/master/contrib/airsonic.service
        https://raw.githubusercontent.com/airsonic/airsonic/master/contrib/airsonic-systemd-env
        )

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/lib/airsonic
  mkdir -p $pkgdir/var/lib/airsonic/playlists
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/etc/airsonic
  cp airsonic.war $pkgdir/var/lib/airsonic
  sed -i 's/\/var\/airsonic/\/var\/lib\/airsonic/' airsonic.service
  sed -i 's/\/etc\/sysconfig\/airsonic/\/etc\/airsonic\/airsonic.conf/' airsonic.service
  cp $srcdir/airsonic.service $pkgdir/usr/lib/systemd/system
  sed -i 's/\/var\/airsonic/\/var\/lib\/airsonic/' airsonic-systemd-env  
  cp airsonic-systemd-env $pkgdir/etc/airsonic/airsonic.conf
}

sha256sums=('2647f2fcbd54c5c9a474fcadf8f479d17d4428d59b460b6e73cb528414359229'
            'd24c07f9f585fc00fd564290cc7b7035d7f27ff7183f13c3fa4e6e23490e9531'
            '059a43fe100d95aaaae8091d1c312f4d3a2a2b4edc1969358dd7be35f6525930'
            )
