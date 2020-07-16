# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dktools
pkgver=4.29.2
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
sha256sums=('927c4a6f5828bde7be220755b8bdadd4fc9a964074c9d51a05d4bb9b958ca7b6')

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
