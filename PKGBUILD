# Maintainer: Sven Frenzel <aur@frenzel.dk>
pkgname="lidarr"
pkgver="0.2.0.291"
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
source=("https://ci.appveyor.com/api/buildjobs/e9247o9i1s614hc2/artifacts/Lidarr.develop.0.2.0.291.linux.tar.gz"
        "lidarr.service"
        "lidarr.sysusers")
noextract=()

sha512sums=("c6cc4a281b43a0ab3560f25044884c50b44364e2d52211cf099a34de5b7bc54ae89031b93d9c6777569d3b6d34af6060387fb3145d9cc3158f81c4fd50ef5ede"
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
