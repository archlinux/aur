# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>

pkgname=libresonic
pkgver=6.2
pkgrel=2
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Libresonic/libresonic/"
license=('GPL3')
depends=('java-runtime-headless')
conflicts=('subsonic' 'subsonic-kang' 'subsonic-kang-git' 'subsonic-beta')
backup=('var/lib/libresonic/libresonic.sh')
noextract=(libresonic-v${pkgver}.war)
install=$pkgname.install
source=(https://github.com/Libresonic/libresonic/releases/download/v${pkgver}/libresonic-v${pkgver}.war
        'libresonic.sh'
        'libresonic.service')

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/lib/libresonic
  mkdir -p $pkgdir/var/lib/libresonic/playlists
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/etc/
  mv libresonic-v${pkgver}.war libresonic.war
  cp  * $pkgdir/var/lib/libresonic
  ln -fs /var/lib/libresonic/libresonic.sh $pkgdir/etc/libresonic.conf
  cp $srcdir/libresonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/lib/libresonic/libresonic.sh
}

sha256sums=('458249eda3f105c0023c7b51d5983ed71a2cb6a3d3a22dd39be656ee359fab99'
            '94bac6db567d01825d9795d2ae5813a80820c4066b4d3a3fdcdcb9e8c5bfafa8'
            'afcef7b8ce8ceab58569440ed17d5828f39da072ea0d6e3e9fb82ac2feafcf9f')
