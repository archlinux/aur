# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=teamspeak2
pkgver=rc2_2032
pkgrel=6
pkgdesc="TeamSpeak is software for quality voice communication via the Internet"
url="http://www.teamspeak.com/"
license=('custom')
depends=('libxext' 'libjpeg6' 'libsm')
arch=('i686')
source=('teamspeak2.desktop' \
'http://dl.4players.de/ts/archives/ts2/releases/ts2_client_rc2_2032.tar.bz2')
sha256sums=('05f333692bb79d6cfe490c008462c6ffb6058e018f39a9bddb0d40b988e2d69e'
            'd06e0354b51e4ddfd4411104d07dd4f9f7c1c6ba908471f03299049362e36254')

package() {
    # Modify Launcher Script
    cd ${srcdir}/ts2_client_rc2_2032/setup.data/image/
    sed -i "s:%installdir%:/opt/teamspeak2:" TeamSpeak

    # Install Desktop Icons
    install -D -m644 "${srcdir}/teamspeak2.desktop" \
        "${pkgdir}/usr/share/applications/teamspeak2.desktop"
    install -D -m644 "${srcdir}/ts2_client_rc2_2032/setup.data/image/icon.xpm" \
        "${pkgdir}/usr/share/pixmaps/teamspeak2.xpm"

    # Install Custom License
    install -D -m644 "${srcdir}/ts2_client_rc2_2032/setup.data/image/clicense.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/clicense.txt"

    # Move Program Data to Package Directory
    cd "${srcdir}/ts2_client_rc2_2032/setup.data/"
    install -d -m755 "${pkgdir}/opt/"
    mv image/ "${pkgdir}/opt/teamspeak2"

    # Link in /usr/bin/
    install -d -m755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/teamspeak2/TeamSpeak" \
        "${pkgdir}/usr/bin/teamspeak2"
}

