# Maintainer: Sven Frenzel <aur@frenzel.dk>

pkgname='lidarr'
pkgver='0.7.1.1381'
pkgrel=1
pkgdesc='Music downloader for usenet and torrents.'
arch=(any)
url='https://github.com/lidarr/Lidarr'
license=('GPL3')
depends=('mono' 'sqlite' 'chromaprint')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'qbittorrent: torrent downloader'
            'qbittorrent-nox: torrent downloader (no X)'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

source=("https://github.com/lidarr/Lidarr/releases/download/v${pkgver}/Lidarr.master.${pkgver}.linux.tar.gz"
        'lidarr.service'
        'lidarr.tmpfiles'
        'lidarr.sysusers')

sha512sums=('b33c205acb507898952a61eb2e5cc7fd73abf99efd3201cc6e7b8af6774764b907788a0c7d9c69a41c5325e1129083dae905beec337404370d17373b26b9efab'
            '61d40f22f0187a0273dd9d766961ca6d65f96a550bf7999ce89d221847aaa754cfbfdfed309c9afca813d097ac999d5661f531d6619422782209de0f43f2d2e8'
            'e40ce79a3e1741e7e06312797e652a85d199bd6d719ef953ea8c3c030756ee44e202956ac9e13cff17fac38312c27398f457f79923a7d0f56bd563a69af6ab63'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622')

package() {
  rm -rf "${srcdir}/Lidarr/Lidarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/lidarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr"
  chmod -R a=,a+rX,u+w ${pkgdir}/usr/lib/lidarr/

  install -D -m 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -D -m 644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -D -m 644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
