# Maintainer: Donald Webster <fryfrog@gmail.com>
pkgname="radarr"
pkgver=0.1
pkgsub=d
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
source=("https://github.com/galli-leo/Radarr/releases/download/v${pkgver}-${pkgsub}/Radarr_Mono_v${pkgver}-${pkgsub}-fixed.zip"
        "radarr.sh"
        "radarr.service")
noextract=()

sha512sums=('5f002e6eb3477164547037816783932faa5cba55e96dec2f2ccd0cd0f602d095c5d947136225db9fe8a62412e57259174763e7cb50bf7f7f700f2e55a99a444f'
            '9edd2fea914ea744c87d72a1e0dcb903e9e2d335cb51f5a29ad157f5ba27ed78638787f99b8ec42b2bac96d042f1a48858fc78c6c134e26d63da553e83001f6a'
            '237a74e8ae8c968da33c44241f0b47fb3209b15ecc1962f45286adab466701d0c7be91cffc7e856951d14f1b72e565ad6fd97115bc1feb1c3bfd4f8c07f453fd')

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/var/lib/radarr"

    msg2 "Install Radarr in /usr/lib"
    install -d -m 755 "${pkgdir}/usr/lib/radarr"
    cp -dpr --no-preserve=ownership "${srcdir}/_output/"* "${pkgdir}/usr/lib/radarr"

    msg2 "Install executable into /usr/bin"
    install -D -m755 "${srcdir}/radarr.sh" "${pkgdir}/usr/bin/radarr"

    msg2 "Install radarr.service"
    install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
}
