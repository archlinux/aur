# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor:: Justin Dray <justin@dray.be>
# Contributor:: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname="sonarr-phantom"
pkgver="3.0.0.222"
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
conflicts=('sonarr' 'sonarr-develop')

source=("http://download.sonarr.tv/v3/phantom/${pkgver}/Sonarr.phantom.${pkgver}.linux.tar.gz"
        "sonarr.service"
        "sonarr.sysusers"
        "sonarr.tmpfiles")

noextract=()
sha256sums=('c7f7bac280acd2af339f196db23d7ec2b5fdc60ee9b9b018bb8b5cab460a0f45'
            '4d1e659961211f5946e38b4ce0b050a119f0543d5e98c4817fe701147e97dca4'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            'a436a979ca3a9e78bdc410bd0027d97956bfa8d2d4f2b7bdf3f7d2ed199dd6a8')

package() {
  cd "$srcdir"

  install -d -m 755 "${pkgdir}/var/lib/sonarr"

  install -d -m 755 "${pkgdir}/usr/lib/sonarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Sonarr/"* "${pkgdir}/usr/lib/sonarr"

  install -D -m 644 "${srcdir}/sonarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"
  install -D -m 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
  install -D -m 644 "${srcdir}/sonarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sonarr.conf"
}
