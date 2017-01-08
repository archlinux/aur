# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Devin Buhl <devin.kray@gmail.com>
pkgname="radarr"
pkgver="0.1.0.34353"
pkgrel=1
pkgdesc="Movie downloader for usenet and torrents."
arch=(any)
url="https://github.com/galli-leo/Radarr"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite')
optdepends=('sabnzbd: an NZB downloader'
            'nzbget: an NZB downloader'
            'transmission-cli: a torrent downloader (CLI and daemon version)'
            'transmission-gtk: a torrent downloader (GTK+ version)'
            'transmission-qt: a torrent downloader (Qt version)'
            'deluge: a torrent downloader')
install='radarr.install'
provides=('radarr')
source=("https://github.com/galli-leo/Radarr/releases/download/v${pkgver}/Radarr_Mono_v${pkgver}.tar.gz"
        "radarr.sh"
        "radarr.service")
noextract=()

sha512sums=('3444511C29A72A6794A558523104DC5F99B6A4F0F975447D130F452BB0CF2BF998B027778145093B665ADF916499CB8441F28C94AD5E8E777D60331577355A8F'
            '17c0a54de94ab6e4523ab5f3f65bd40b592cc6723acaf123db8bbf0d2c6200e4b5877878c542fe849c09b9748ab8c8887cbd94365ba431cf71fc1256f24b43ec'
            '237a74e8ae8c968da33c44241f0b47fb3209b15ecc1962f45286adab466701d0c7be91cffc7e856951d14f1b72e565ad6fd97115bc1feb1c3bfd4f8c07f453fd')

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/var/lib/radarr"

    msg2 "Install Radarr in /usr/lib"
    install -d -m 755 "${pkgdir}/usr/lib/radarr"
    cp -dpr --no-preserve=ownership "${srcdir}/"* "${pkgdir}/usr/lib/radarr"

    msg2 "Install executable into /usr/bin"
    install -D -m755 "${srcdir}/radarr.sh" "${pkgdir}/usr/bin/radarr"

    msg2 "Install radarr.service"
    install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
}
