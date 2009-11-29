# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=teamspeak2
pkgver=rc2_2032
pkgrel=5
pkgdesc="TeamSpeak is software for quality voice communication via the Internet"
url="http://www.goteamspeak.com/"
license="custom"
depends=('libxext' 'libjpeg6' 'libsm')
arch=('i686')
source=('teamspeak.desktop' \
"ftp://ftp.freenet.de/pub/4players/teamspeak.org/releases/ts2_client_${pkgver}.tar.bz2")
md5sums=('2c2f5358bb058a47ab9422ba2331de7e'
         'e93d17a25e07b1cbe400e4eb028ca8f8')

build() {
    # Modify Launcher Script
    cd $srcdir/ts2_client_rc2_2032/setup.data/image/
    sed -i "s:%installdir%:/opt/teamspeak:" TeamSpeak

    # Install Desktop Icons
    install -D -m644 $srcdir/teamspeak.desktop \
        $pkgdir/usr/share/applications/teamspeak.desktop
    install -D -m644 $srcdir/ts2_client_rc2_2032/setup.data/image/icon.xpm \
        $pkgdir/usr/share/pixmaps/teamspeak.xpm

    # Install Custom License
    install -D -m644 $srcdir/ts2_client_rc2_2032/setup.data/image/clicense.txt \
        $pkgdir/usr/share/licenses/$pkgname/clicense.txt

    # Move Program Data to Package Directory
    cd $srcdir/ts2_client_rc2_2032/setup.data/
    install -d -m755 $pkgdir/opt/
    mv image/ $pkgdir/opt/teamspeak

    # Link in /usr/bin/
    install -d -m755 $pkgdir/usr/bin/
    ln -sf /opt/teamspeak/TeamSpeak $pkgdir/usr/bin/
}
