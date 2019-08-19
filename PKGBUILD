# Maintainer: David Adler <d.adler@posteo.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=gjacktransport
pkgver=0.6.4
pkgrel=3
pkgdesc="Graphical slider and clock for JACK Transport"
arch=('x86_64')
url="http://gjacktransport.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'jack')
makedepends=('intltool')
backup=('etc/gjackclockrc' 'etc/gjacktransportrc')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/v0.6/$pkgname-$pkgver.tar.gz")
md5sums=('96102577be683f32732bf368a6f44c06')

build() {
  cd "$pkgname-$pkgver"
  
  ./configure \
	  --prefix=/usr \
	  --sysconfdir=/etc/
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Install desktop files
  install -Dm644 gjackclock.desktop "$pkgdir/usr/share/applications/gjackclock.desktop"
  install -Dm644 gjacktransport.desktop "$pkgdir/usr/share/applications/gjacktransport.desktop"
}

