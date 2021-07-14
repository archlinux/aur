pkgname=rdo
pkgver=1.0
pkgrel=3
pkgdesc="A simple doas/sudo alternative."
arch=('x86_64')
url=https://codeberg.org/sw1tchbl4d3/rdo
license=('GPL3')

source=(
"https://codeberg.org/sw1tchbl4d3/rdo/archive/${pkgver}.tar.gz"
)

sha512sums=(
"25084a61bfa2df5e42ba71cc8244f362c16eff77c0f6b00e799fbf85661f8fb5f7b181d3027ff9f3becd899178cebb6635eb403057cae6717b1887d8c2841bdf"
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
