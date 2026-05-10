# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=geomspace
pkgver=0.14
pkgrel=2
pkgdesc="A browser for geometric (i.e. Euclidean, Riemann, Minkowski) spaces"
arch=($CARCH)
url="https://sourceforge.net/projects/geomspace/"
license=(GPL-2.0-only)
depends=(opengl-driver fltk libxpm)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgver/GeomSpace-${pkgver}a-src.tar.gz
		http://downloads.sourceforge.net/project/$pkgname/Theory/UniformGeomSpace-2010.11.02-en.pdf
		make.patch
		x11.patch
		deps.patch)
sha256sums=('e85c03b4d74ccb6fcdf3994165a2d86fdc3650b85a2a0da43c6b88d3a5dfa6a9'
            '0f045c086e745dccf45e66d4a361cea91fde0c913a0d67150ac79ef7a2ed466a'
            '09e0a65343a7aa702d8ee4bc8494aeae8083f00fafc9bbf07a83eba6ec722049'
            '981d7f339c9031092d14f8a8f5439708492637626b05becdd8028ca056399350'
            'c29f2bc38e78dab0586b3cb8cc446e51e9a90065c1db628648fd23820be33792')

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
	install -Dm644 GeomSpace/models/*.gms* -t $pkgdir/usr/share/GeomSpace/models/
	install -Dm644 UniformGeomSpace-2010.11.02-en.pdf GeomSpace/doc/{DeveloperManual-en.pdf,UserManual-en.pdf} -t \
		$pkgdir/usr/share/doc/$pkgname/
	install -Dm644 GeomSpace/bin/GeomSpace.desktop -t $pkgdir/usr/share/applications/
	
	msg "\033[31;1m The user manual and a document containing a theory explanation have been installed to /usr/share/doc/$pkgname. It is strongly recommended to read them in order to use Geomspace! \033[0m"
	msg "\033[31;1m Some models of geometrical objects have been installed to /usr/share/$pkgname/models. Additional models can be found at http://sourceforge.net/projects/geomspace/files/Models/ \033[0m"
}
