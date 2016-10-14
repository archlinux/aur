# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Justin Dray <justin@dray.be>

_pkgname=sickrage
pkgname=$_pkgname-pip
pkgver=8.5.6.r0.gf7d7168
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
makedepends=('git')
depends=('python2-virtualenv')
#            'deluge: supported torrent client'
#            'qbittorrent: supported torrent client'
#            'rtorrent: supported torrent client'
#            'sabnzbd: supported NZB downloader'
#            'transmission-cli: supported torrent client'
optdepends=('unrar: RAR archives')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SiCKRAGETV/SickRage.git"
        'sickrage.service' 'sickrage.sysusers' 'sickrage.tmpfile')
md5sums=('SKIP'
         '3d67651fa77e6f2a0c37a995ad20bc2f'
         '6a7db7e14e74072d29e482b06b41dfa7'
         'f7a12df978d649da4e77d88e03f50252')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.sysusers "$pkgdir/usr/lib/sysusers.d/sickrage.conf"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"
}

