# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Devin Buhl <devin.kray@gmail.com>
pkgname="radarr"
pkgver="0.2.0.778"
pkgrel=1
pkgdesc="Movie downloader for usenet and torrents."
arch=(any)
url="https://github.com/galli-leo/Radarr"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite' 'libgdiplus')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy')
install='radarr.install'
source=("https://github.com/galli-leo/Radarr/releases/download/v${pkgver}/Radarr.develop.${pkgver}.linux.tar.gz"
        "radarr.service"
        "radarr.sysusers")
noextract=()

sha512sums=('29372f8e8fae4577289941c8950d0495a03bb29c5b6f9f65f2b754d726b3eaeaf5322fd11d8ca1075b2e8452d89f3b6876713f4f9b1605d3706eace47784b9b1'
            'a66aa6a7000353f71d6f8b301a35d3dbd8fba7fe001d796fe934a6faa62160a16e8764918ed065c3e438637043f5dc4ef0eeee1cc25e1687e2cdc4f766d1cd34'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e')

package() {
  cd "$srcdir"

  install -d -m 755 "${pkgdir}/var/lib/radarr"
  install -d -m 755 "${pkgdir}/usr/lib/radarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr"

  find "${pkgdir}/usr/lib/radarr" -type f -exec chmod 644 '{}' ';'

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -Dm644 "$srcdir/radarr.sysusers" "$pkgdir/usr/lib/sysusers.d/radarr.conf"
}
