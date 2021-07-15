pkgname=rdo
pkgver=1.1
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
"110c42a67510f165a7c5736ce9505f45538d6fc4860b5bb0f2b35d3e98ec47395c50e981e8ce0cdfb949ea84a72b72fc18c29be7986d5b881598b7da48d9c898"
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
