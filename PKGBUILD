# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>

pkgname=airsonic
pkgver=10.0.0
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Airsonic/airsonic/"
license=('GPL3')
depends=('java-runtime-headless')
conflicts=('subsonic' 'subsonic-kang' 'subsonic-kang-git' 'subsonic-beta' 'libresonic')
backup=('var/lib/airsonic/airsonic.sh')
noextract=(airsonic-jdbc-extra.war)
install=$pkgname.install
source=(https://github.com/airsonic/airsonic/releases/download/v${pkgver}/airsonic-jdbc-extra.war
        'airsonic.sh'
        'airsonic.service')

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/lib/airsonic
  mkdir -p $pkgdir/var/lib/airsonic/playlists
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/etc/
  mv airsonic-jdbc-extra.war airsonic.war
  cp  * $pkgdir/var/lib/airsonic
  ln -fs /var/lib/airsonic/airsonic.sh $pkgdir/etc/airsonic.conf
  cp $srcdir/airsonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/lib/airsonic/airsonic.sh
}

sha256sums=('613f459906eff22466aaa1711964ea14f82d9acd0287b1a801ef9e55e62f086d'
            'c80475ea59cfb02fd667fafcfc5367513a5d31d98878e2317ef98d47689b7e25'
            '5ba2274f536fb7d16f6c0266500419a0c3834f6acdeeca81ba9b83264e839a1a')
