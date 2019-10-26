
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://radarr.lidarr.audio/v1/update/aphrodite?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="radarr-aphrodite"
pkgver="2.0.0.2127"
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Radarr/Radarr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('libmediainfo' 'sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('radarr')
conflicts=('radarr') 

source_x86_64=("Radarr.aphrodite.${pkgver}.linux-core-x64.tar.gz::https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("Radarr.aphrodite.${pkgver}.linux-core-arm64.tar.gz::https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("Radarr.aphrodite.${pkgver}.linux-core-arm.tar.gz::https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('radarr.service'
        'radarr.tmpfiles'
        'radarr.sysusers')

sha512sums=('feb90578b0a7f3949884f735e1ec2004b66c84c9fe4d54e578e8573551c0364d89c84ed7b38c0494ad0a24146d6c5113f65fa6da6fd31f5083b2e188cb9ed9fe'
            'e0d55353f0bf89f826eb7eb9ee26c3e3f38bd46a8884135139536ae220c0c531d5df486bc3b50f580679f9607bb4b7bfb9f29998609dc966fbfb8e1809834650'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e')
sha512sums_x86_64=('2cbf520902fe437081ee8591cc99a76a262db178a892f8c9c9b198c1dd6091609539f9723df76bfdf606c397a8244bd722c2013988c2c2a015268c9057f5a8c3')
sha512sums_aarch64=('ee95774843c350357d0df1fad5e8e5618c5ea65f8056cf7dbd0f05e36d9f1415822fa32aebe01602a497885e398b1a9526be3866424fa688eee0ba6f3d15e58c')
sha512sums_armv7h=('591f9a576462c02a8e7c93d71cec5592e572b8eb8b844d2e53c003abce01a185564cd6e617dedee6e0ac9f43991b82dcd273d4f6d63703ef3f2db432d25e5e34')


package() {
  rm -rf "${srcdir}/Radarr/Radarr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/radarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/radarr"
  chmod +x "${pkgdir}/usr/lib/radarr/Radarr"

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -D -m 644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -D -m 644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
