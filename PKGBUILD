# Contributor: boteium
pkgname=sniffjoke
pkgver=20170814
pkgrel=1
license=("GPL")
pkgdesc="An internet client running SniffJoke injects in the transmission flow some packets able to seriously disturb passive analysis like sniffing, \
interception and low level information theft"
arch=('i686' 'x86_64')
url='https://github.com/vecna/sniffjoke'
depends=('cmake' 'gcc' 'iptables' 'tcpdump')
source=('https://github.com/vecna/sniffjoke/archive/master.zip' )

md5sums=('SKIP')
build() {
	cd "$srcdir/sniffjoke-master/"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_SBINDIR=/usr/bin -DSYSCONFDIR=/etc/sniffjoke ..
	make 
}
package(){
	cd "$srcdir/sniffjoke-master/build"
	make DESTDIR=$pkgdir install

	cd "$pkgdir/usr/"
	mv "./sbin/sniffjoke" ./bin/
	rmdir sbin
}
