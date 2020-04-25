# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://readarr.servarr.com/v1/update/readarr/updatefile?os=linux&runtime=netcore&arch=x64

pkgname="readarr"
pkgver=0.1.0.37
pkgrel=1
pkgdesc="eBook and audio book downloader for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Readarr/Readarr"
license=("GPL3")
depends=('sqlite')
options=('!strip' 'staticlibs')
optdepends=('calibre: calibre-server as root folder'
            'sabnzbd: usenet downloader'
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
sha512sums_x86_64=('e595f645d60a6068f49240a4d9eaf3fb6649e09cb6beebf2b26cb710f8d87048e5c420a4f417c02ee0e57115ce04102a8e01ed74ba42af6fe73ced120673485c')
sha512sums_aarch64=('792612d2106d5969e42cfc8b249ecbfda528fed13144691498047ca78311fc8d56eec746e8448fa1e0b1a8228d9caa3c9f28dcd32f964925091db0aa46ffa6ff')
sha512sums_armv7h=('60d6f00082a3f8799be1cca58247c0985bd9ab12ac76aa85257d16fba001a9106bd12cdb2217c9ace9c03ee41e4f4c30ef5cd1e24f676aeb5396354fd99925de')



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
