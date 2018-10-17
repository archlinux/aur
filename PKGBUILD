# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dktools
pkgver=4.19.1
pkgrel=1
pkgdesc="a collection of several tools by Dirk Krause. dktools includes graphic converters, text converters, some daemons, Perl modules, some development tools, administration tools and printing tools."
arch=('i686' 'x86_64')
url="http://dktools.sourceforge.net"
license=('dktools-license')
groups=()
depends=('wxgtk3' 'netpbm' 'net-snmp')
makedepends=('wxgtk3') # also optional runtime dependency for wxbmpp, wxdkct and wximgsz
optdepends=('wxgtk3: for wxbmpp, wxdkct and wximgsz'
	    'libmariadbclient: for itadmin')
source=(http://sourceforge.net/projects/dktools/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('eb4a8c930331f5a18fb2089d5c02f142ccaf69f0fdd8a7f7629dfe60697371b8')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make -i DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/var/run
  install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgdir"/usr/sbin/*
  rm -r "$pkgdir"/usr/sbin/
}
