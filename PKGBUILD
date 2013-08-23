# Contributor: Stefano Tortarolo <stefano@inventati.org>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=findimagedupes
pkgver=2.18
pkgrel=2
pkgdesc="Tool to find visually similar or duplicate images"
arch=('i686' 'x86_64')
url="http://www.jhnc.org/findimagedupes/"
license=('GPL3')
depends=('perl' 'perl-file-mimeinfo' 'perl-inline' 'graphicsmagick')
makedepends=('perl' 'sed')
source=(http://www.jhnc.org/$pkgname/$pkgname-$pkgver.tar.gz
	findimagedupes-2.18.patch)
md5sums=('5c353c6e4611e194114d4192c32c6adb'
         '7a75e6e1f0520bd1d02c3862417f3829')
options=('zipman')

build() {
	cd $srcdir/$pkgname-$pkgver
	sed -i -e "s:DIRECTORY => '/usr/local/lib/$pkgname':DIRECTORY => '/tmp':" $pkgname
	patch -i $srcdir/findimagedupes-2.18.patch -p0
	pod2man findimagedupes > findimagedupes.1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -D -m 755 findimagedupes $pkgdir/usr/bin/findimagedupes
	install -D -m 644 findimagedupes.1 $pkgdir/usr/share/man/man1/findimagedupes.1
}
