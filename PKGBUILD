pkgname=rdo
pkgver=1.2
pkgrel=1
pkgdesc="A simple doas/sudo alternative."
arch=('x86_64' 'aarch64')
url=https://codeberg.org/sw1tchbl4d3/rdo
license=('GPL3')
depends=('libbsd')

source=(
"https://codeberg.org/sw1tchbl4d3/rdo/archive/${pkgver}.tar.gz"
)

sha512sums=(
"fb4c50b007dbca3c82b33607d3b10f1d841f325f709599325a2ce28721a977d6d0ebafed60a398d60eb09f056c69c39986170f883cd37e244e4eb2d5a106556c"
)

build() {
	cd $srcdir/rdo
	make
}

package() {
	cd $srcdir/rdo
	mkdir -p $pkgdir/etc
	mkdir -p $pkgdir/usr/bin
	cp rdo $pkgdir/usr/bin/rdo
	chown root:root $pkgdir/usr/bin/rdo
	chmod 755 $pkgdir/usr/bin/rdo
	chmod u+s $pkgdir/usr/bin/rdo
	
	cp rdo_sample.conf $pkgdir/etc/rdo.conf
	sed -i "s/sw1tchbl4d3/$USER/g" $pkgdir/etc/rdo.conf
}
