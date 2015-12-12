# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Justin Dray <justin@dray.be>


# In case of upgrade errors:
#     error: failed to commit transaction (conflicting files)
#     sickrage-git: /opt/sickrage/... exists in filesystem
# Remove the conflicting files manually. The following will remove all or most of the conflicting files:
#     # rm -rf /opt/sickrage/{contrib/,contributing.md,COPYING.txt,gui/,lib/,runscripts/,sickbeard/,SickBeard.py,sickrage/,tests/}
# Use at your own risk!


_pkgname=sickrage
pkgname=$_pkgname-git
pkgver=4.1.0.2.r370.g4da36fb
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
#unrar
makedepends=('git')
depends=('python2-mako' 'python2-cheetah')
#            'deluge: supported torrent client'
#            'qbittorrent: supported torrent client'
#            'rtorrent: supported torrent client'
#            'sabnzbd: supported NZB downloader'
#            'transmission-cli: supported torrent client'
optdepends=('python2-notify: desktop notifications'
            'python2-pyopenssl: enable SSL'
            'unrar: RAR archives')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SiCKRAGETV/SickRage.git"
        'sickrage.service'
        'sickrage.tmpfile')
md5sums=('SKIP'
         'd55285ca7b6e6b01413f3a9e46cc0c4d'
         'f7a12df978d649da4e77d88e03f50252')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd $pkgname
#  sed -i 's/UnRAR2/unrar2/g' lib/unrar2/test_UnRAR2.py
#}
#
#check() {
#  cd $pkgname/lib/unrar2
#  PYTHONPATH="$(pwd)/..:$PYTHONPATH" python2 test_UnRAR2.py
#}

package() {
  # The sickrage "SOURCE" install type does not have the .git folder (git repository files)
  install -dm755 "$pkgdir/opt/sickrage"
  cp -rp $pkgname/* "$pkgdir/opt/sickrage"
 
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"
}

