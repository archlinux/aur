# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor:: Justin Dray <justin@dray.be>
# Contributor:: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname="sonarr-phantom"
pkgver=3.0.3.741
pkgrel=1
pkgdesc="TV download automation for usenet and torrents."
arch=(any)
url="http://www.sonarr.tv"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy')

provides=('sonarr')

conflicts=('sonarr'
           'sonarr-develop')

source=("https://download.sonarr.tv/v3/phantom-develop/${pkgver}/Sonarr.phantom-develop.${pkgver}.linux.tar.gz"
        "sonarr.service"
        "sonarr.sysusers"
        "sonarr.tmpfiles")

noextract=()
sha256sums=('98299a7a617278b3e688fd3052edc57b5786d8a5596b53ce16469fc8beb761a4'
            '0cf9f57403939df673755949ca39a1981f542b97ca28116c599f321a939f5d00'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            'a436a979ca3a9e78bdc410bd0027d97956bfa8d2d4f2b7bdf3f7d2ed199dd6a8')

package() {
  rm -rf "${srcdir}/Sonarr/Sonarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/sonarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Sonarr/"* "${pkgdir}/usr/lib/sonarr"

  install -D -m 644 "${srcdir}/sonarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"
  install -D -m 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
  install -D -m 644 "${srcdir}/sonarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sonarr.conf"
}
