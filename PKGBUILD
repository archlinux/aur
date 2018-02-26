
pkgname=passenger-nginx-module
pkgver=5.2.0
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
sha256sums=('e46cd80c6e17d70ab7c880795ef83936b4790e4dad4970dee19ce952f091704a')

build(){
  cd $srcdir/passenger-$pkgver
  rake nginx CACHING=false
}

package() {
  cd $srcdir/passenger-$pkgver

  mkdir -p $pkgdir/usr/lib/passenger/
  cp -R * $pkgdir/usr/lib/passenger/

  mkdir -p $pkgdir/etc/profile.d/
  echo '[ -d /usr/lib/passenger/bin ] && PATH=$PATH:/usr/lib/passenger/bin' > $pkgdir/etc/profile.d/passenger.sh
  chmod +x $pkgdir/etc/profile.d/passenger.sh
}
