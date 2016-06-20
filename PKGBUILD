
pkgname=passenger-nginx-module
pkgver=5.0.28
pkgrel=1
pkgdesc="Phusion Passenger configured for use as a static nginx module."
arch=('i686' 'x86_64')
url="https://www.phusionpassenger.com/"
_watch="https://www.phusionpassenger.com/file_releases"
license=('GPL')
depends=('ruby' 'ruby-rack' 'curl')
optdepends=('nginx-mainline-passenger: web server.')
provides=('passenger')
conflicts=('passenger')
options=('!emptydirs' 'staticlibs')
source=(http://s3.amazonaws.com/phusion-passenger/releases/passenger-$pkgver.tar.gz)
md5sums=('9953d178a4eb7d2744b32e8ee71b90af')

build(){
  cd $srcdir/passenger-$pkgver
  rake nginx CACHING=false
}

package() {
  cd $srcdir/passenger-$pkgver

  mkdir -p $pkgdir/usr/lib/passenger/
  cp -R * $pkgdir/usr/lib/passenger/
}
