# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Justin Dray <justin@dray.be>

_pkgname=sickrage
pkgname=$_pkgname-git
pkgver=4.0.24.r2.gf9246bc
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage and torrents support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
depends=('python2-cheetah')
makedepends=('git')
optdepends=('python2-notify: desktop notifications'
            'python2-pyopenssl: enable ssl'
            'sabnzbd: NZB downloader'
            'unrar: rar archives')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SiCKRAGETV/SickRage.git"
        'sickrage.service'
        'sickrage.tmpfile')
md5sums=('SKIP'
         '9c03e4b2ed134981afefc643cac2c282'
         'f7a12df978d649da4e77d88e03f50252')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i 's|#![ \t]*/usr/bin/env python[ \t\r]*$|#!/usr/bin/env python2|' autoProcessTV/*.py
}

package() {
  # 'source' install type. Does not include git repository files
  install -dm755 "$pkgdir/opt/sickrage"
  cp -rp $pkgname/* "$pkgdir/opt/sickrage"
 
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"
}

