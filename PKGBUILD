# Maintainer: alisoftware <admin at situsali dot com>
pkgname=kbbi-qt
pkgver=1.0
pkgrel=1
pkgdesc="Kamus Besar Bahasa Indonesia Luring."
arch=('i686' 'x86_64')
url="https://github.com/bgli/kbbi-qt"
license=('GPL3')
depends=('qt5-base')
makedepends=('make' 'qt5-base' 'git')
source=("${pkgname}"::"git+https://github.com/bgli/${pkgname}.git" "kbbi-qt.desktop")
md5sums=('SKIP' 'SKIP')


build()	{
  cd ${srcdir}/${pkgname}/src
  qmake KBBI-Qt.pro
  make 
}

package() {
	cd ${srcdir}/
  	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/share/${pkgname}/
	mkdir -p ${pkgdir}/usr/share/${pkgname}/data/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
	mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	install -Dm755 ${pkgname}/src/data/KBBI.db ${pkgdir}/usr/share/${pkgname}/data/
	cp ${pkgname}/src/kbbi-qt.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
	install -Dm755 ${pkgname}/src/KBBI-Qt ${pkgdir}/usr/bin/${pkgname}
	cp ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	cp ${pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README
	install -Dm644 -T ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop	
}