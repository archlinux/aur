pkgname=rdo
pkgver=1.3
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
"bdfefe006269a61d6387a265ec02ba8953b6014025bdb2f722e4ebf619c3002835c26d257d60890ffd616a82601dac63a2e526b6643ad7b36e257c2c1c97b72b"
)

build() {
	cd $srcdir/rdo
	make
}

package() {
	cd $srcdir/rdo
	mkdir -p $pkgdir/etc
	mkdir -p $pkgdir/usr/bin
	install -oroot -Dm4755 rdo $pkgdir/usr/bin/rdo 
	install -oroot -Dm0640 rdo_sample.conf $pkgdir/etc/rdo.conf
	sed -i "s/sw1tchbl4d3/$USER/g" $pkgdir/etc/rdo.conf
}
