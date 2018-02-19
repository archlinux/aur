# Maintainer: Sven Frenzel <aur@frenzel.dk>
pkgname="lidarr"
pkgver="0.2.0.284"
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
install="lidarr.install"
source=("https://ci.appveyor.com/api/buildjobs/o1c3v7ef88xbst2v/artifacts/Lidarr.develop.0.2.0.284.linux.tar.gz"
        "lidarr.service"
        "lidarr.sysusers")
noextract=()

sha512sums=("c2db15f0e4d58911b836c4ae8bbcb6154c43690b2131766d7f1d02f93a9564964b171ab7d4774b67821bfc731f557b9ce4625f47c6811d3d81ef44244ca954af"
            "47bdb3bcefa39fd095aeae7b8ed19c80b43f9d3a90e2537088ee6ec0fdbe3472c7524e9adbe5a949dc800ff47d98f4edd8e1e5427a1a6cd730305d4be65f04cf"
            "ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622")

package() {
  cd "$srcdir"

  install -dm 755 "${pkgdir}/var/lib/lidarr"
  install -dm 755 "${pkgdir}/usr/lib/lidarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr"

  find "${pkgdir}/usr/lib/lidarr" -type f -exec chmod 644 "{}" ";"

  install -Dm 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -Dm 644 "$srcdir/lidarr.sysusers" "$pkgdir/usr/lib/sysusers.d/lidarr.conf"
}
