# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dktools
pkgver=4.38.0
pkgrel=2
pkgdesc="Collection of tools by Dirk Krause, including converters, daemons, Perl modules, development tools, administration tools and printing tools."
arch=('i686' 'x86_64')
url="http://dktools.sourceforge.net"
license=('custom')
depends=('wxwidgets-gtk3' 'netpbm' 'net-snmp')
makedepends=('wxwidgets-gtk3') # also optional runtime dependency for wxbmpp, wxdkct and wximgsz
optdepends=('wxwidgets-gtk3: for wxbmpp, wxdkct and wximgsz'
	    'mariadb-libs: for itadmin')
source=(http://sourceforge.net/projects/dktools/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('04da9185e8f8288ceb8c71dabcb6994ee2e67c835dfb2e7d958098d9b5e0b517')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make -i DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/var
  install -Dm755 -t "$pkgdir"/usr/bin/ "$pkgdir"/usr/sbin/*
  rm -r "$pkgdir"{/lib,/usr/sbin/}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
