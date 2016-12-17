# Maintainer: Navkamal Rakra <navkamal90[at]gmail[dot]com>

pkgname=ogdf
pkgver=2015.05
pkgrel=1
epoch=
pkgdesc="Open Graph Drawing Framework : Self-contained C++ class library for the automatic layout of 
diagrams. Offers sophisticated algorithms and data structures to use within your own applications 
or scientific projects"
arch=('x86_64' 'i686')
url="http://www.ogdf.net/doku.php/start"
license=('GPL')
depends=()
makedepends=(python2 unzip)
checkdepends=()
optdepends=()
provides=()
conflicts=(OGDF)
replaces=(OGDF)
backup=()
options=()
install=
changelog=
source=("${pkgname}.v${pkgver}.zip::http://www.ogdf.net/lib/exe/fetch.php/tech:${pkgname}.v${pkgver}.zip")
#source = (".v${pkgver}.zip")
noextract=("${pkgname}.v${pkgver}.zip")
md5sums=('b652b1b137e63245db6e412196551bc6')
validpgpkeys=()

prepare() {
	unzip -L ${pkgname}.v${pkgver}.zip
	sed -i 's/^\(installPrefix\s*=\s*\).*$/\1\/usr/' ${srcdir}/OGDF/makeMakefile.config
}

build() {
	cd "OGDF"
	python2 makeMakefile.py
	make
}

package() {
	cd "${srcdir}/OGDF"
	make DESTDIR="${pkgdir}" install

	mkdir -p ${pkgdir}/usr/lib/
	cp -r _release ${pkgdir}/usr/lib/

#	mkdir -p ${pkgdir}/usr/include/
#	cp -r include ${pkgdir}/usr/include/

	mkdir -p ${pkgdir}/etc/${pkgname}.v${pkgver}
	cp -r config ${pkgdir}/etc/${pkgname}.v${pkgver}

	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}.v${pkgver}
	cp -r doc ${pkgdir}/usr/share/doc/${pkgname}.v${pkgver}

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}.v${pkgver}
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}.v${pkgver}/LICENSE.txt"
	install -Dm644 LICENSE_GPL_v2.txt "${pkgdir}/usr/share/licenses/${pkgname}.v${pkgver}/LICENSE_GPL_v2.txt"
	install -Dm644 LICENSE_GPL_v3.txt "${pkgdir}/usr/share/licenses/${pkgname}.v${pkgver}/LICENSE_GPL_v3.txt"
	
}
