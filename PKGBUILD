# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Devin Buhl <devin.kray@gmail.com>
pkgname="radarr"
pkgver="0.2.0.299"
pkgrel=1
pkgdesc="Movie downloader for usenet and torrents."
arch=(any)
url="https://github.com/galli-leo/Radarr"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite' 'libgdiplus')
optdepends=('sabnzbd: an NZB downloader'
            'nzbget: an NZB downloader'
            'transmission-cli: a torrent downloader (CLI and daemon version)'
            'transmission-gtk: a torrent downloader (GTK+ version)'
            'transmission-qt: a torrent downloader (Qt version)'
            'deluge: a torrent downloader')
install='radarr.install'
provides=('radarr')
source=("https://github.com/galli-leo/Radarr/releases/download/v${pkgver}/Radarr.develop.${pkgver}.linux.tar.gz"
        "radarr.sh"
        "radarr.service")
noextract=()

sha512sums=('cc6ae1a8959f53bc8557d8e4b54b10d2b9e47e7b459506a1e689c8bd9ecd2b9e17337577cb7103fc903da850fb3176fb3bba2278a3e1bfe2b2b907c2bc20211a'
            '17c0a54de94ab6e4523ab5f3f65bd40b592cc6723acaf123db8bbf0d2c6200e4b5877878c542fe849c09b9748ab8c8887cbd94365ba431cf71fc1256f24b43ec'
            '58260b3d1e0638aa2269fb81a077686c203ae638d6d93712eb0552e93b8b5f517f6d104464b119d5d38ea521e130e3ee80579113526433337f0578576917b7e1')

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/var/lib/radarr"

    msg2 "Install Radarr in /usr/lib"
    install -d -m 755 "${pkgdir}/usr/lib/radarr"
    cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr"

    msg2 "Fixing permissions in /usr/lib/radarr/"
    find "${pkgdir}/usr/lib/radarr" -type f -exec chmod 644 '{}' ';'

    msg2 "Install executable into /usr/bin"
    install -D -m755 "${srcdir}/radarr.sh" "${pkgdir}/usr/bin/radarr"

    msg2 "Install radarr.service"
    install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
}
