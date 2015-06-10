# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Black_Codec

pkgname=suxpanel
pkgver=0.4b
pkgrel=3
pkgdesc="A lightweight X11 desktop panel"
arch=('x86_64' 'i686')
url="http://suxpanel.berlios.de/"
license=('GPL')
depends=('gtk2' 'libwnck')
source=(http://download.berlios.de/suxpanel/$pkgname-$pkgver.tar.gz)
md5sums=('a89d1b4fde46db553d326ca69c392441')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  sed -e 's, -lgobject-2.0, -lgmodule-2.0 -lgobject-2.0,' -i Makefile
  sed -e 's,/usr/share/suxpanel/plugins,/usr/lib/suxpanel/plugins,' -i Makefile
  sed -e 's, -shared , -fPIC -shared ,' -i Makefile
  sed -e 's,/usr/share/suxpanel/plugins,/usr/lib/suxpanel/plugins,' -i suxpanel-install.sh
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
    
  mkdir -p "$pkgdir/usr/lib/suxpanel/plugins"
  make DESTDIR="$pkgdir" install
  cp ./suxpanel-install.sh $pkgdir/usr/share/suxpanel/
}
