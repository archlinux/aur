# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://ci.appveyor.com/project/Lidarr/lidarr/branch/develop/artifacts

pkgname="lidarr-develop"
pkgver="0.3.1.483"
_pkghash="vfjb0xh8k6kccuek"
pkgrel=1
pkgdesc="Music downloader for usenet and torrents."
arch=(any)
url="https://github.com/lidarr/Lidarr"
license=("GPL3")
depends=('mono' 'libmediainfo' 'sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('lidarr')
conflicts=('lidarr')

source=("https://ci.appveyor.com/api/buildjobs/${_pkghash}/artifacts/Lidarr.develop.${pkgver}.linux.tar.gz"
        'lidarr.service'
        'lidarr.tmpfiles'
        'lidarr.sysusers')

sha512sums=('d23f722ace4fad229377a9d59ea2eaf4ad65320765ac8bce20eb70c7616e4bf8a9d6c0136f039465ed48e990a05388825785acd32b004d4c6ae95601e2e4d2f8'
            'f910a619c850889105b1934cb4a77e6482faee9e24b4e33db1bc35957149fe3ea6f43eb8f1056555182b3af7672769ab98105b575314d35eff973fa993e62eed'
            'e40ce79a3e1741e7e06312797e652a85d199bd6d719ef953ea8c3c030756ee44e202956ac9e13cff17fac38312c27398f457f79923a7d0f56bd563a69af6ab63'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lidarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/lidarr/"

  install -D -m 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -D -m 644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -D -m 644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
