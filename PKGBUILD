# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: victorique <r+aur@wwad.de> (curlnew patch)

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=foxtrotgps
pkgver=1.1.1
pkgrel=2
license=('GPL')
pkgdesc="a lightweight and fast mapping application (fork of tangoGPS)"
arch=(i686 x86_64)
depends=('libglade' 'gconf' 'libxml2' 'libexif' 'curl' 'gpsd' 'sqlite3')
makedepends=('intltool' 'bluez')
optdepends=('python2: import GeoRSS points'
            'gpscorrelate: photo-geotagging'
            'jhead: photo-geotagging'
            'bluez: Zephyr HxM heartrate-monitor support')
source=(http://www.foxtrotgps.org/releases/$pkgname-$pkgver.tar.gz)
install=foxtrotgps.install
url="http://www.foxtrotgps.org/"
md5sums=('6777d448ee9d3ba195f9d26ea90e3163')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  sed -i 's/python$/python2/' "$pkgdir"/usr/bin/georss2foxtrotgps-poi
  sed -i 's/python$/python2/' "$pkgdir"/usr/bin/osb2foxtrot
  sed -i 's/python$/python2/' "$pkgdir"/usr/bin/poi2osm
}
