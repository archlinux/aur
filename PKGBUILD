# Maintainer: robertfoster
# Contributors: Thom Wiggers <thom@thomwiggers.nl>
# Contributors: hoban
# Contributors: Nrm
# Contributors: MattScherbatsky
# Contributors: robozman

pkgname=subsonic
pkgver=6.1.6
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="http://subsonic.org/"
license=('custom')
depends=('java-runtime-headless<=8')
conflicts=('subsonic')
backup=('var/lib/subsonic/db' 'var/lib/subsonic/subsonic.properties' 'var/lib/subsonic/subsonic.sh')
install=$pkgname.install
source=("https://sourceforge.net/projects/subsonic/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-standalone.tar.gz"
'subsonic.service')

package() {
    cd ${srcdir}
    mkdir -p $pkgdir/var/lib/subsonic
    mkdir -p $pkgdir/var/playlists
    mkdir -p $pkgdir/usr/lib/systemd/system
    mkdir -p $pkgdir/etc/
    sed -i 's/\/var\/subsonic/\/var\/lib\/subsonic/' subsonic.sh
    cp  * $pkgdir/var/lib/subsonic
    rm $pkgdir/var/lib/subsonic/{subsonic.bat,subsonic-${pkgver}-standalone.tar.gz}
    ln -fs /var/lib/subsonic/subsonic.sh $pkgdir/etc/subsonic.conf
    cp $srcdir/subsonic.service $pkgdir/usr/lib/systemd/system
    chmod +x $pkgdir/var/lib/subsonic/subsonic.sh
}

sha256sums=('dfb78fa9bb38f2265f498122846b1d6121f7666035a78dbe3a24305bd16c18a0'
'f5404721615b6e1ce7b5212b41f8799bc8ed09c8a1a9c5de71e439da41d2c6aa')
