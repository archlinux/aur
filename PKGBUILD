# Maintainer: Dan Johansen <strit83 at gmail dot com>
# Contributor: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname=opentracker
pkgver=2016.10.02
pkgrel=4
pkgdesc="A free and open torrent tracker"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://erdgeist.org/arts/software/opentracker/"
license=('Beerware')
backup=('etc/opentracker/opentracker.conf')
makedepends=('git' 'cvs')
install="$pkgname.install"
source=('git://erdgeist.org/opentracker'
        "opentracker.service")
md5sums=('SKIP'
         'a50d9ccbcf820cff15d082e9bc447bf1')

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
	install -Dm755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm755 $srcdir/$pkgname/$pkgname.conf.sample $pkgdir/etc/$pkgname/$pkgname.conf
	install -Dm0644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}
