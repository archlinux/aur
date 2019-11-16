# Contributor: Yosef Or Boczko <yoseforb@gmail.com>

pkgname=geoip-git
pkgver=1.6.12.r8.g44e5ffc
pkgrel=1
pkgdesc="Non-DNS IP-to-country resolver C library & utils"
epoch=1
arch=('i686' 'x86_64')
url="http://www.maxmind.com/app/c"
license=('GPL')
makedepends=('git')
depends=('zlib' 'geoip-database')
source=("$pkgname::git://github.com/maxmind/geoip-api-c.git")
sha256sums=('SKIP')
conflicts=('geoip')
provides=('geoip')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc/geoip \
    --disable-data-files
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
