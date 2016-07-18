# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=opentracker
pkgver=20160718
pkgrel=1
pkgdesc="A free and open torrent tracker"
arch=('x86_64' 'i686' 'armv7h' 'armv7l' 'aarch64')
url="http://erdgeist.org/arts/software/opentracker/"
license=('GPL')
depends=('git' 'cvs')
provides=(opentracker)
conflicts=(opentracker)

pkgver() {
#  cd "$srcdir/opentracker"
  git log -n 1 --pretty=format:"%cd" --date=short | sed "s/-/./g"
}

build() {
	cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat
	cd libowfat
	make
	cd ..
	git clone git://erdgeist.org/opentracker
	cd opentracker
	make

}

package() {
	install -dm755 $pkgdir/opt/$pkgname/
	install -dm755 $pkgdir/usr/share/applications/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/$pkgname/$pkgname $pkgdir/opt/$pkgname/$pkgname
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

}
