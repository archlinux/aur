# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
pkgname="sonarr"
pkgver="2.0.0.4928"
pkgrel=1
pkgdesc="PVR for newsgroup users. Formerly known as NZBDrone"
arch=(any)
url="https://sonarr.tv"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite')
optdepends=('sabnzbd: an NZB downloader'
            'nzbget: an NZB downloader'
            'transmission-cli: a torrent downloader (CLI and daemon version)'
            'transmission-gtk: a torrent downloader (GTK+ version)'
            'transmission-qt: a torrent downloader (Qt version)'
            'deluge: a torrent downloader')
install='sonarr.install'
provides=('nzbdrone' 'nzbdrone-torrents')
conflicts=('nzbdrone' 'nzbdrone-torrents')
replaces=('nzbdrone' 'nzbdrone-torrents')
source=("https://update.sonarr.tv/v2/master/mono/NzbDrone.master.${pkgver}.mono.tar.gz"
        "sonarr.sh"
        "sonarr.service"
        "sonarr.sysusers")
noextract=()
sha512sums=('0e7ab3c5b849018f51370ee564423308069794181255b07a11dd21c513ac19ef486bc1bb84acf84dc6e439227db6ff77a784f4dcde4d1910b123b86b0719a360'
            '24177aac07d92c659e341419825cc56300f27cc665796580d3ad865134c504f5f4a7c26dbfe9612bd1d6c62a5113a2d7cd53d9292b7c108a0348053eae1fceec'
            '438de225c38c26aaa15cae243b18d0be85f3f0e54f1297bf182082a0bdbd936d21928cdcdb899f0f18c6ec32ee88c2e0f0d29b8a2a1cdf98a8e1907cd6f36a2c'
            '35af6024f61003c83e1b35bc5658bd8dbce65cadb6f06e6415de20f4c25ab4c4f107224c27668810f99c4a00bfd24175176c35a4b660243935aef872a39ebce7')

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/var/lib/sonarr"

    msg2 "Install Sonarr in /usr/lib"
    install -d -m 755 "${pkgdir}/usr/lib/sonarr"
    cp -dpr --no-preserve=ownership "${srcdir}/NzbDrone/"* "${pkgdir}/usr/lib/sonarr"

    msg2 "Install executable into /usr/bin"
    install -D -m755 "${srcdir}/sonarr.sh" "${pkgdir}/usr/bin/sonarr"

    msg2 "Install sonarr.service"
    install -D -m 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"

    install -Dm644 "$srcdir/sonarr.sysusers" "$pkgdir/usr/lib/sysusers.d/sonarr.conf"
}
