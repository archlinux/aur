# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cwdaemon
_author=acerion
pkgver=0.10.2
#.r4.g44f36eb
pkgrel=2
pkgdesc="Ham Radio Morse Code transmitter - text input is sent via udp port 6789."
arch=('i686' 'x86_64')
url="http://cwdaemon.sourceforge.net"
license=('GPL')
#depends=('unixcw>=3.3.1' 'netcat')
depends=('unixcw' 'netcat')
source=("$pkgname::git+https://github.com/$_author/$pkgname#branch=master"
#http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	diff.Makefile.am
	diff.Makefile.am.example)

pkgver() {
	cd $srcdir/$pkgname

	git describe --long | sed -r 's/-([0-9,a-g,A-G].*)//'
#	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare () {
	cd $srcdir/$pkgname

	patch -p0 < ../diff.Makefile.am
	sed -i s:sbin:bin: src/Makefile.am
	patch -p0 < ../diff.Makefile.am.example
}

build() {
	cd $srcdir/$pkgname

	aclocal --force
	libtoolize --force
	autoheader -f
	automake -a -c -f 
	autoconf -f
			 
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname

	make prefix=$pkgdir/usr install
}                                                  
md5sums=('SKIP'
         '9afaea52e53c3140388633ed608bf0ed'
         'db518d891fb68c02168111f46340899d')
sha256sums=('SKIP'
            'af0343ee5691c256ccb206284d683f88b551132446cd9ecd1dc3cc87af72e833'
            'fb40a17f6cc5b0910e588c8c815a5340069b013af3207017073eff6ca58cca26')
