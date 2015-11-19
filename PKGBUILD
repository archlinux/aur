# Maintainer: willemw <willemw12@gmail.com>


# In case of upgrade errors:
#     error: failed to commit transaction (conflicting files)
#     sickrage-git: /opt/sickrage/... exists in filesystem
# Remove the conflicting files manually. The following will remove all or most of the conflicting files:
#     # rm -rf /opt/sickrage/{contrib/,contributing.md,COPYING.txt,gui/,lib/,runscripts/,sickbeard/,SickBeard.py,sickrage/,tests/}
# Use at your own risk!


_pkgname=sickrage2
pkgname=$_pkgname-git
pkgver=4.2.0.2.r2.gea24e7b
pkgrel=1
pkgdesc="Automatic torrent/nzb video library manager for TV shows"
arch=('any')
url="https://github.com/SickRage/SickRage"
license=('GPL3')
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
provides=($_pkgname 'sickrage')
conflicts=($_pkgname 'sickrage')
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SickRage/SickRage.git"
        'sickrage.service'
        'sickrage.tmpfile')
md5sums=('SKIP'
         '9c03e4b2ed134981afefc643cac2c282'
         'f7a12df978d649da4e77d88e03f50252')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # The "source" sickrage install type does not include the .git folder (git repository files)
  install -dm755 "$pkgdir/opt/sickrage"
  cp -rp $pkgname/* "$pkgdir/opt/sickrage"
 
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"
}

