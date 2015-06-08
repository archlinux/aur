# Maintainer: Your Name <address at domain dot com>

pkgname=hoc
pkgver=9.2
pkgrel=1
pkgdesc="An extended version of the Kernighan & Pike High Order Calculator"
arch=('i686' 'x86_64')
url="http://nadav.harel.org.il/homepage/hoc/"
license=('BSD')
depends=()
makedepends=('bison')
optdepends=()
options=()
#install=
source=(http://nadav.harel.org.il/homepage/$pkgname/$pkgname-$pkgver.tgz)
#noextract=()
md5sums=('3d11ba6f6731502b6c7efa8078573adc') #generate with 'makepkg -g'

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr || return 1
	#sed -e 's/-s hoc.*$/-t $(bindir) hoc/' ./Makefile
	sed -i 's#$(INSTALL_PROGRAM) -s hoc $(bindir)#$(INSTALL_PROGRAM) -s -t $(DESTDIR)$(bindir) hoc #' "$srcdir/$pkgname-$pkgver/Makefile"
	#mkdir $pkgdir/usr/bin
	install -d $pkgdir/usr/bin
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}