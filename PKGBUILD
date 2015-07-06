# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=gtkmmorse
pkgver=0.9.28
#.r6.ge857be9
pkgrel=1
pkgdesc="GUI Morse code tutor (based on ALDO) - Koch & Classic training modes."
arch=('i686' 'x86_64')
url="http://gtkmmorse.nongnu.org/"
license=('GPL')
depends=('libao' 'gtkmm' 'gconfmm' 'desktop-file-utils')
makedepends=('autoconf' 'automake' 'gcc')
install=$pkgname.install
source=("$pkgname::git://git.sv.gnu.org/$pkgname.git"
	$pkgname.desktop)

#pkgver() {
#	cd "$srcdir/$pkgname"
#	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
	cd $srcdir/$pkgname
	sed -i s:'-4.3':: src/Makefile.am
}

build() {
	cd $srcdir/$pkgname
	./autogen.sh
	./configure --prefix=/usr --mandir=/usr/share/man
	make || return 1
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/share/applications
	install -m644 ../*.desktop $pkgdir/usr/share/applications/
}
md5sums=('SKIP'
         'f502a07fa34399d9e1ec662bb8236743')
sha256sums=('SKIP'
            '8db6b4d36e6db1251d5b0e8a2a8d92ab35df8bd7794979c6b56e746b477b820d')
