# Maintainer: alisoftware <admin at situsali dot com>
pkgname=kbbi-qt
pkgver=1.0
pkgrel=3
pkgdesc="Kamus Besar Bahasa Indonesia Luring."
arch=('i686' 'x86_64')
url="https://github.com/bgli/kbbi-qt"
license=('GPL3')
depends=('qt5-base')
makedepends=('make' 'qt5-base' 'git')
source=("${pkgname}"::"git+https://github.com/bgli/${pkgname}.git")
md5sums=('SKIP')
originname=KBBI-Qt

build()	{
  cd ${srcdir}/${pkgname}
  qmake KBBI-Qt.pro
  make 
}

package() {
	cd ${srcdir}/
  	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/share/${originname}/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/pixmaps/
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	cp -R ${pkgname}/src/data/ ${pkgdir}/usr/share/${originname}
	cp ${pkgname}/src/kbbi-qt.png ${pkgdir}/usr/share/pixmaps/
	install -Dm755 ${pkgname}/${originname} ${pkgdir}/usr/bin/
	cp ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	cp ${pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README
	install -Dm644 -T ${pkgname}/${originname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop	
}
