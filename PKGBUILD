# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=geomspace
pkgver=0.13
pkgrel=1
pkgdesc="A browser for geometric (i.e. Euclidean, Riemann, Minkowski) spaces"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/geomspace/"
license=('GPL')
depends=('libxpm' 'mesa' 'fltk')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgver/GeomSpace-$pkgver-src.tar.gz \
	http://downloads.sourceforge.net/project/$pkgname/Theory/UniformGeomSpace-2010.11.02-en.pdf \
	http://sourceforge.net/projects/geomspace/files/Models/5Cubes.gmsp
	http://sourceforge.net/projects/geomspace/files/Models/5Tetra.gmsp
	make.patch \
	geomspace.png \
	geomspace.desktop \
	linux.mk)
md5sums=('4c709d41e1347de9b12024cd9fafb36d'
			'14560f6f2cba975be1ba8d047b5acec5'
			'205c728191134d15cd5053e37c30a454'
			'520350c4ab6aa1385f75028d22e769be'
			'bd4927170182ea7c8dcf367fda7a0f5c'
			'86af94ebce3f2d5a40e3a01fb1e1b0bc'
			'0987c858a20d66760bb2627d9517eb8d'
			'e17a8796e00b951ba2fcd7b53356a73c')
_pkgname=GeomSpace
build() {
	cp linux.mk $srcdir/GeomSpace/make
   cd $srcdir/GeomSpace/make
   patch Makefile < $srcdir/make.patch
	echo "OS = linux" > platform
	make || return 1
}
package() {
    install -D -m755 $srcdir/GeomSpace/bin/geomspace $pkgdir/usr/bin/geomspace
    install -D -m644 $srcdir/GeomSpace/doc/DeveloperManual-en.pdf $pkgdir/usr/share/doc/$pkgname/DeveloperManual-en.pdf
    install -D -m644 $srcdir/GeomSpace/doc/UserManual-en.pdf $pkgdir/usr/share/doc/$pkgname/UserManual-en.pdf
    install -D -m644 $srcdir/UniformGeomSpace-2010.11.02-en.pdf $pkgdir/usr/share/doc/$pkgname/UniformGeomSpace-2010.11.02-en.pdf
	 install -D -m644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	 install -D -m644 ../${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	 install -d -m755 ${pkgdir}/usr/share/${_pkgname}
	 install -d -m755 ${pkgdir}/usr/share/${_pkgname}/models
	 install -d -m755 ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 ../5Cubes.gmsp ${pkgdir}/usr/share/${_pkgname}/models
	 install -D -m644 ../5Tetra.gmsp ${pkgdir}/usr/share/${_pkgname}/models	
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/C ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/de ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/ro ${pkgdir}/usr/share/${_pkgname}/i18n
	 install -D -m644 $srcdir/GeomSpace/bin/i18n/ru ${pkgdir}/usr/share/${_pkgname}/i18n
    msg "\033[31;1m The user manual and a document containing a theory explanation have been installed to /usr/share/doc/$pkgname. It is strongly recommended to read them in order to use Geomspace! \033[0m"
	 msg "\033[31;1m Some models of geometrical objects have been installed to /usr/share/$pkgname/models. Additional models can be found at http://sourceforge.net/projects/geomspace/files/Models/ \033[0m"
}
