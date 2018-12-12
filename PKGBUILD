# Maintainer: Sven Frenzel <aur@frenzel.dk>

pkgname="lidarr"
pkgver="0.5.0.583"
pkgrel=1
pkgdesc="Music downloader for usenet and torrents."
arch=(any)
url="https://github.com/lidarr/Lidarr"
license=("GPL3")
depends=("mono" "libmediainfo" "sqlite")
optdepends=("sabnzbd: usenet downloader"
            "nzbget: usenet downloader"
            "transmission-cli: torrent downloader (CLI and daemon)"
            "transmission-gtk: torrent downloader (GTK+)"
            "transmission-qt: torrent downloader (Qt)"
            "deluge: torrent downloader"
            "rtorrent: torrent downloader"
            "jackett: torrent indexer proxy"
            "libgdiplus: provides a gdi+ compatible api")

source=("https://github.com/lidarr/Lidarr/releases/download/v${pkgver}/Lidarr.develop.${pkgver}.linux.tar.gz"
        "lidarr.service"
        "lidarr.tmpfiles"
        "lidarr.sysusers")

sha512sums=('59de0bb98647ff2499d9c49059784745ed66c0959eda8ce5fb353f0d69ef90f15de949f6c40bb181b835b80b674f8fac8b7914bfe9aace8818c2f5cf2c6afafc'
            'e339ad3fe7d7569d65346309ffa69ea5f68001a45ae6e1a494e786fc4711a189f38cd73bb4d9bafdb3e5315a625f1c25301804473830418d8284192cb0c04c84'
            'e40ce79a3e1741e7e06312797e652a85d199bd6d719ef953ea8c3c030756ee44e202956ac9e13cff17fac38312c27398f457f79923a7d0f56bd563a69af6ab63'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lidarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr"
  chmod -R a=,a+rX,u+w ${pkgdir}/usr/lib/lidarr/

  install -D -m 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -D -m 644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -D -m 644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
