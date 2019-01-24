# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
pkgname="sonarr"
pkgver="2.0.0.5301"
pkgrel=1
pkgdesc="PVR for newsgroup users"
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
source=("https://update.sonarr.tv/v2/master/mono/NzbDrone.master.${pkgver}.mono.tar.gz"
        "sonarr.sh"
        "sonarr.service"
        "sonarr.sysusers")
noextract=()
sha512sums=('bb33e87203ab1dbf5d3a118e4ebcb02e7cf0256253d1b52cd9e46331be6232c1473515b9ff38dde040e25fa9619e61b655f1a99038b362158f3d7e659b51d164'
            '84efa2eebd9afe6b74203aefdc3fdbd4088ecfad17dbe929396f1ffc639743b615a9b75566a0b45d6b7925bd5675368015047c6d65c1421ffe8712728f350695'
            '591c76551f511198afa71b98bd5c1e3a800af4c24f8be3065148a0dccce85dcb2cdbad03e55efb66441f900df3b97043ea6bd1574cc0653808b8ab0e54abd999'
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
