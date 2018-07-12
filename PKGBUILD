# Maintainer: Justin Dray <justin@dray.be>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="sonarr-develop"
pkgver=2.0.0.5239
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

install='sonarr.install'
provides=('sonarr')
conflicts=('sonarr')
source=("https://download.sonarr.tv/v2/develop/mono/NzbDrone.develop.${pkgver}.mono.tar.gz"
        "sonarr.service"
        "sonarr.sysusers"
        "sonarr.install")
noextract=()
sha256sums=('15206c3ba421c7db282de82562084a473666e09447d2ccd7fa28557e03860548'
            'ffcd28b3779aae0edf093956dfbd3239bea0b32561da75ab1d198de92db197c5'
            'cc3c69f719fa64335f4c5b41b2588f1ec56865fb2202f5919d3668b50b8f398e'
            'ce45de775371d7b05f8f1313679b8a94e093fb2fae8ea2cb7558428c1d51d9af')

package() {
  cd "$srcdir"

  install -d -m 755 "${pkgdir}/var/lib/sonarr"

  install -d -m 755 "${pkgdir}/usr/lib/sonarr"
  cp -dpr --no-preserve=ownership "${srcdir}/NzbDrone/"* "${pkgdir}/usr/lib/sonarr"

  install -D -m 644 "${srcdir}/sonarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"
  install -D -m 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
}
