# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=aldo
pkgver=0.7.8
pkgrel=2
pkgdesc="Morse Code tutor with a random number generator & skill level testing"
arch=('i686' 'x86_64')
url="http://aldo.nongnu.org/"
license=('GPL3')
depends=('libao' 'gcc-libs' 'hamradio-menus')
makedepends=('git' 'autoconf' 'automake' 'libtool')
source=("$pkgname::git+http://git.savannah.gnu.org/r/$pkgname.git#branch=master"
#http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.bz2
	$pkgname.desktop
	hamradio.png)
# Not sure where the authors are going, so I decided to use the last tagged master
# branch in the software (git) repo; ....which is ALSO the first tagged 0.7.8.
# Alas the runiing program sezs 0.7.7 and it was last updated in 2013.
# SO.....I did what you see here !!!!
#
# Optionally YOU can "instead" use the switch out sources (tar for the git),
# and remove the pkgver(), prepare(), plus switch the "cd ....." lines .
# (Oh and remove the makedepends= .... hi hi.)

pkgver(){
	cd $pkgname

	git describe | sed 's/^v//'
#	git describe --long | sed -r 's/-([0-9,a-g,A-G].*)//' | sed 's/-/./' | sed 's/^v//'
}

prepare() {
	cd $srcdir/$pkgname

	aclocal --force
	libtoolize --force
	autoheader -f
	automake -a -c -f 
	autoconf -f
}


build() {
	cd $srcdir/$pkgname
#	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
	make || return 1
}

check() {
	cd $srcdir/$pkgname

	make check
#	make -k check
#	make -i check
}

package() {
	cd $srcdir/$pkgname
#	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install                  

	mkdir -p $pkgdir/usr/share/$pkgname
	install -m644 README $pkgdir/usr/share/$pkgname/

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -m644 ../*.desktop $pkgdir/usr/share/applications/
	install -m644 ../hamradio.png $pkgdir/usr/share/pixmaps/
}
md5sums=('SKIP'
         'db0b42dd5494090f4382d854433eba06'
         'b24ce93a15cca693efa662ab90ae0fda')
sha256sums=('SKIP'
            '34db7c1c2ac1b2d5d434a4fbf8c6b87f62f7fe1e873b9b236c854fb4ff87962d'
            'e55aabbf91ad110672d87290582705a55c6a52bb5b487c7bd195f5e18cc550b3')
