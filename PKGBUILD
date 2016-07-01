# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gdnsd
pkgver=2.2.4
pkgrel=3
pkgdesc="an Authoritative-only DNS server which does geographic balancing, redirection, weighting, and service-state-conscious failover at the DNS layer"
arch=(i686 x86_64)
url="http://gdnsd.org/"
license=('GPL3')
makedepends=('ragel' 'libev')
checkdepends=('perl-socket6' 'perl-io-socket-inet6' 'perl-http-daemon' 'perl-libwww')
source=("https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('de32d05e5cc876af2241d1430ea85479')

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf -vif    
}

build() {
	cd "$pkgname-$pkgver"
	./configure \
 	  --prefix=/usr \
	  --sbindir=/usr/bin \
	  --localstatedir=/ \
	  --libexecdir=/usr/lib \
	  --with-systemdsystemunitdir=/usr/lib/systemd/system
	  
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	rm -rf $pkgdir/lib
}

