# Contributor: Anton Leontiev <unsector /at/ km.ru>
pkgname=lasercalc
pkgver=0.5.1
pkgrel=2
pkgdesc='A tool to calculate optical paths and resonators based on Gaussian beam matrix optics'
arch=('i686' 'x86_64')
url='https://sourceforge.net/apps/phpwebsite/lasercalc/'
license=('GPL3')
depends=('wxgtk2.9')
makedepends=('wxgtk2.9' 'autoconf2.13')
install=lasercalc.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
        lasercalc.desktop)
md5sums=('63930093bb5b4e459873a71d3ca3e598'
         '73612ba4597ea5c4278390a42caa62ea')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf-2.13 -i
	./configure --prefix=/usr --with-wx-config=wx-config-2.9
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 src/lasercalc.xpm "$pkgdir/usr/share/pixmaps/lasercalc.xpm"
	install -Dm644 "$srcdir/lasercalc.desktop" "$pkgdir/usr/share/applications/lasercalc.desktop"
}
