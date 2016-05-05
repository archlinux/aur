# Maintainer: Ben Ruijl <benruyl at gmail>

pkgname=couchpotato-git
_gitname=CouchPotatoServer
pkgver=4869.c4fad95
pkgrel=2
pkgdesc="Automatic Movie Downloading via NZBs & Torrent"
arch=('any')
url="http://couchpota.to/"
license=('GPL3')
depends=('python2' 'python2-lxml')
makedepends=('git')
provides=('couchpotato')
conflicts=('couchpotato')
install='couchpotato.install'
source=('git://github.com/RuudBurger/CouchPotatoServer.git' 'couchpotato.service')
md5sums=('SKIP' 'af02374e700522e56cb9bc606bf31731')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "$srcdir/$_gitname" "${pkgdir}/opt/couchpotato"

   # Fix for issues with Python 3
  find "${pkgdir}/opt/couchpotato" -type f -exec sed -i 's/env python/env python2/g' {} \;

  install -Dm644 "${srcdir}/couchpotato.service" "${pkgdir}/usr/lib/systemd/system/couchpotato.service"
}
