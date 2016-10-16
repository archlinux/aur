# Contributor: Stefano Tortarolo <stefano@inventati.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=findimagedupes
pkgver=2.18
pkgrel=4
pkgdesc='Tool to find visually similar or duplicate images'
arch=('any')
url="http://www.jhnc.org/findimagedupes/"
license=('GPL3')
depends=('perl-file-mimeinfo' 'perl-inline-c' 'graphicsmagick')
makedepends=('perl' 'sed')
source=(http://http.debian.net/debian/pool/main/f/$pkgname/${pkgname}_$pkgver.orig.tar.gz
	findimagedupes-2.18.patch)
md5sums=('5c353c6e4611e194114d4192c32c6adb'
         '7a75e6e1f0520bd1d02c3862417f3829')
options=('zipman')

build() {
	cd $pkgname-$pkgver
	sed -i -e "s:DIRECTORY => '/usr/local/lib/$pkgname':DIRECTORY => '/tmp':" $pkgname
	patch -i $srcdir/findimagedupes-2.18.patch -p0
	pod2man findimagedupes > findimagedupes.1
}

package() {
	cd $pkgname-$pkgver
	install -D -m 755 findimagedupes $pkgdir/usr/bin/findimagedupes
	install -D -m 644 findimagedupes.1 $pkgdir/usr/share/man/man1/findimagedupes.1
}
