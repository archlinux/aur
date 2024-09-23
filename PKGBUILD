# Maintainer: Pavel Miksha <miksha.rogender@gmail.com>

pkgname=cgaserver-bin
pkgver=4.1.1.0
pkgrel=1
pkgdesc="GNU/Linux dedicated server for Classic Gaming Arena."
arch=("x86_64")
url="https://www.classicgamingarena.com/"
license=("Unlicense")

source=("https://www.classicgamingarena.com/download-cgaserver-linux-64bit-tar" 
	"https://gist.githubusercontent.com/keyboardcrash32/d4e06e450da65aec5e60e0ecc88f0098/raw/fd84449731543643c0bfd638d49dd89860d7766a/cgaserver.service")

sha512sums=('21ca2a02111cbec139b4d63dab6423e822e9378160851c8360728ef18e61559bd3b7222287b364402ab74e35d00b4ba678899b1c0041aeba584841d4a749793d' 'fc26a1adcb6f1ee088b095457054b0df3546dd10bf31340730e53b2fd7b85002e2385e76da6ef165c0115d068bb16845ee114414270b70712b69193d6c072e9f')

build()
{
	mv download-cgaserver-linux-64bit-tar cgaserver.tar.gz
	tar xf cgaserver.tar.gz
}

package()
{
	install -D $srcdir/etc/cgaserver/cgaserver_default.conf $pkgdir/etc/cgaserver/cgaserver_default.conf
	#install -D $srcdir/etc/init.d/cgaserver $pkgdir/etc/init.d/cgaserver
	install -D $srcdir/cgaserver.service $pkgdir/etc/systemd/system/cgaserver.service
	install -D $srcdir/usr/lib/libts3server_linux_amd64.so $pkgdir/usr/lib/libts3server_linux_amd64.so
	install -D $srcdir/usr/sbin/cga/server/cgaserver $pkgdir/usr/bin/cga/server/cgaserver
	install -D $srcdir/usr/share/doc/cgaserver/changes.txt $pkgdir/usr/share/doc/cgaserver/changes.txt
	install -D $srcdir/usr/share/doc/cgaserver/license.txt $pkgdir/usr/share/doc/cgaserver/license.txt

	rm cgaserver.tar.gz
}
