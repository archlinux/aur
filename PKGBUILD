# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dktools
pkgver=4.29.0
pkgrel=1
pkgdesc="Collection of tools by Dirk Krause, including converters, daemons, Perl modules, development tools, administration tools and printing tools."
arch=('i686' 'x86_64')
url="http://dktools.sourceforge.net"
license=('custom')
depends=('wxgtk3' 'netpbm' 'net-snmp')
makedepends=('wxgtk3') # also optional runtime dependency for wxbmpp, wxdkct and wximgsz
optdepends=('wxgtk3: for wxbmpp, wxdkct and wximgsz'
	    'libmariadbclient: for itadmin')
source=(http://sourceforge.net/projects/dktools/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('fa7b3d6a6fa0c200804b3535c3528b470b7bf9dcf3e48e08f1536f74af267175')

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
  install -Dm644 bsdlic.txt "$pkgdir"/usr/share/licenses/$pkgname/bsdlic.txt
}
