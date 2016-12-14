# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=opentracker
pkgver=2016.10.02
pkgrel=2
pkgdesc="A free and open torrent tracker"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
url="http://erdgeist.org/arts/software/opentracker/"
license=('Beerware')
makedepends=('git' 'cvs')
source=('git://erdgeist.org/opentracker')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/opentracker"
  git log -n 1 --pretty=format:"%cd" --date=short | sed "s/-/./g"
}

build() {
	cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat
	cd libowfat
	make
	cd ..
	cd opentracker
	make

}

package() {
	install -dm755 $pkgdir/opt/$pkgname/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/$pkgname/$pkgname $pkgdir/opt/$pkgname/$pkgname
	install -m755 $srcdir/$pkgname/$pkgname.conf.sample $pkgdir/opt/$pkgname/$pkgname.conf.sample
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

}
