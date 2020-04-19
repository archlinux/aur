# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://readarr.servarr.com/v1/update/readarr/updatefile?os=linux&runtime=netcore&arch=x64

pkgname="readarr"
pkgver=0.1.0.29
pkgrel=1
pkgdesc="eBook and audio book downloader for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Readarr/Readarr"
license=("GPL3")
depends=('sqlite')
options=('!strip' 'staticlibs')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'qbittorrent: torrent downloader'
            'qbittorrent-nox: torrent downloader (no X)'
            'jackett: torrent indexer proxy')

source_x86_64=("readarr.${pkgver}.linux-core-x64.tar.gz::https://readarr.servarr.com/v1/update/readarr/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64")
source_aarch64=("readarr.${pkgver}.linux-core-arm64.tar.gz::https://readarr.servarr.com/v1/update/readarr/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64")
source_armv7h=("readarr.${pkgver}.linux-core-arm.tar.gz::https://readarr.servarr.com/v1/update/readarr/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('readarr.service'
        'readarr.tmpfiles'
        'readarr.sysusers')

sha512sums=('9a8a56929999a6c79c4acf816f88002c5cc1271ca28f5ba100a7fc76ade1aed3f7b5fd9a209d754bfff67bddf71fa1a5c6465040c1c38cffacfd2b49032e7a3a'
            '91d27251667d9ffa03b5ab1b5ba459889a62b6f26a575c1fa47bac323d7c31913ee46eab27057bdfecb9719ecb4eb3c3d631351d9fa6cda3ecbb501757d60a14'
            '99f8210754ea5ec742ba6b0b9f05c8312237cb0225bc0d28a2a8ee8362b464da0880499b64ea58c84b64c0eb727748c3c15630cedb8785d7d94d856c76cf17eb')
sha512sums_x86_64=('06aaf303afb7dd9a290af26f17a82a19dfd161430e6d110a729dabb8dacbede2599873b9cd5b113c5a6e18e2db5469a00a6fb4627f6f6dabe3323f07f9de14ac')
sha512sums_aarch64=('224b3d024d68a217c399a3f5e1267808f81b525ca409525ff665ef729af13bb36dc95ee44f6e52c72f3e9f6efc2ddaa0ea94b2ae1913aaa1e1fd2e3471539abf')
sha512sums_armv7h=('0a3352e85425687ea1a12fe5a26d487baa14ca4f07cc41e62b1472916f9ea0cee182424995271548f7b02497a6816e7ebfac704255096dad33bd43281bb1a719')



package() {
  # Update environment isn't needed.
  rm -rf "${srcdir}/Readarr/Readarr.Update"

  install -d -m 755 "${pkgdir}/usr/lib/readarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Readarr/"* "${pkgdir}/usr/lib/readarr"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/readarr/"
  chmod +x "${pkgdir}/usr/lib/readarr/Readarr"

  install -D -m 644 "${srcdir}/readarr.service" "${pkgdir}/usr/lib/systemd/system/readarr.service"
  install -D -m 644 "${srcdir}/readarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/readarr.conf"
  install -D -m 644 "${srcdir}/readarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/readarr.conf"
}
