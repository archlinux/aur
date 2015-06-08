# Contributor: ReNoM <renom@list.ru>
pkgname=mednafen-server
pkgver=0.5.1
pkgrel=1
pkgdesc="Server for Mednafen network game."
arch=(i686 x86_64)
url="http://mednafen.sourceforge.net/"
license="GPL"
#depends=()
#makedepends=()
source=(http://downloads.sourceforge.net/mednafen/$pkgname-$pkgver.tar.gz)
md5sums=('2a2106b795ec3dd99ed773bf830815ca')

build() {
	cd "$srcdir/$pkgname"
	./configure
	make || return 1
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/share/mednafen-server
	mkdir -p $pkgdir/usr/bin/
	install -D -m 644 -t $pkgdir/usr/share/mednafen-server standard.conf
	install -Dv -m644 $srcdir/mednafen-server/src/mednafen-server $pkgdir/usr/bin/mednafen-server
	chmod +x $pkgdir/usr/bin/mednafen-server
}

