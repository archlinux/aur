# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=geomspace
pkgver=0.15
pkgrel=2
pkgdesc="A browser for geometric (i.e. Euclidean, Riemann, Minkowski) spaces"
arch=($CARCH)
url="https://sourceforge.net/projects/geomspace/"
license=(GPL-2.0-only)
depends=(opengl-driver fltk glew libxpm)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgver/GeomSpace-$pkgver-pre-src.tar.gz
		http://downloads.sourceforge.net/project/$pkgname/Theory/UniformGeomSpace-2010.11.02-en.pdf
		make.patch
		x11.patch
		deps.patch)
sha256sums=('f20a8f1f189f8f3084f6ceeece99c7818c1563b83f593de4dfcf37b0570e7f11'
            '0f045c086e745dccf45e66d4a361cea91fde0c913a0d67150ac79ef7a2ed466a'
            '09e0a65343a7aa702d8ee4bc8494aeae8083f00fafc9bbf07a83eba6ec722049'
            '803228b67b4d43bb6f10ad761a54cde87604dba4e00bf3c9a6184ce25ee5ddb7'
            'd2c5898a93b3572baa75d52b3a2679a1242c2338fa29703940a0b01b1f537149')

prepare() {
	cd GeomSpace/make
	patch Makefile < $srcdir/make.patch
	patch x11.mk < $srcdir/x11.patch
	patch deps < $srcdir/deps.patch
}

build() {
	cd GeomSpace/make
	make
}

package() {
	install -Dm755 GeomSpace/bin/GeomSpace -t $pkgdir/usr/bin/
	install -Dm644 GeomSpace/bin/i18n/* -t $pkgdir/usr/share/GeomSpace/i18n/
	install -Dm644 GeomSpace/bin/icn/* -t $pkgdir/usr/share/GeomSpace/icn/
	install -Dm644 GeomSpace/bin/glsl/*.glsl -t $pkgdir/usr/share/GeomSpace/glsl/
	install -Dm644 GeomSpace/models/*.gms* -t $pkgdir/usr/share/GeomSpace/models/
	install -Dm644 UniformGeomSpace-2010.11.02-en.pdf GeomSpace/doc/{DeveloperManual-en.pdf,UserManual-en.pdf} -t \
		$pkgdir/usr/share/doc/$pkgname/
	install -Dm644 GeomSpace/bin/GeomSpace.desktop -t $pkgdir/usr/share/applications/
	
	msg "\033[31;1m The user manual and a document containing a theory explanation have been installed to /usr/share/doc/$pkgname. It is strongly recommended to read them in order to use Geomspace! \033[0m"
	msg "\033[31;1m Some models of geometrical objects have been installed to /usr/share/$pkgname/models. Additional models can be found at http://sourceforge.net/projects/geomspace/files/Models/ \033[0m"
}
