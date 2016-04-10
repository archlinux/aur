# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=eman2
pkgver=2.12
pkgrel=1
pkgdesc="Greyscale scientific image processing suite for processing data from transmission electron microscopes"
arch=(x86_64)
url="http://blake.bcm.edu/emanwiki/EMAN2"
license=('GPL')
depends=()
source=("http://ncmi.bcm.edu/ncmi/software/counter_222/software_133/manage_addProduct/NCMI/attendee_factory/eman$pkgver.linux64.tar.gz" 
'eman2.sh')
md5sums=('2e21b310c957fc3b21f8c6b551b60fdb' 'SKIP')
options=(!strip)

build() {
	cd "$srcdir/EMAN2"
	./eman2-installer
}

package() {
	cd "$srcdir/EMAN2"
	install -d $pkgdir/opt/eman2 $pkgdir/etc/profile.d/
	cp -r * $pkgdir/opt/eman2/.
	install -D -m755 $srcdir/eman2.sh $pkgdir/etc/profile.d/.
	source $pkdir/etc/profile.d/eman2.sh
}
