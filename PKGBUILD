# Maintainer: Martin Fritz <Fritz.Martin99@web.de>
pkgbase=plastikstyle
_pkgbase_camel=PlastikStyle
pkgname=(plastikstyle-qt5 plastikstyle-qt6)
pkgver=1.0.4
pkgrel=5
license=(LGPL-2.1-or-later)
pkgdesc="QStyle for qt5 and qt6 providing the look of KDE3's plastik"
arch=(x86_64)
url=https://codeberg.org/Keit99/PlastikStyle
source=("https://codeberg.org/Keit99/${_pkgbase_camel}/archive/${pkgver}.tar.gz")
sha256sums=('9fa7a5136a29f62722cd3bb80240540edb3b6c5bf1e62627f38d64c0a2c61b60')
makedepends=(qt5-tools
	     qt6-tools
             cmake)
conflicts=(PlastikStyle PlastikStyle-debug plastikstyle plastikstyle-debug)

build(){
	mkdir build-qt6
	cmake -B build-qt6 -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_ALL=OFF -DENABLE_QT6=ON ${srcdir}/${pkgbase}
	cmake --build build-qt6

	mkdir build-qt5
	cmake -B build-qt5 -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_ALL=OFF -DENABLE_QT5=ON ${srcdir}/${pkgbase}
	cmake --build build-qt5
}
package_plastikstyle-qt5(){
	depends=( qt5-base )
	DESTDIR="${pkgdir}" cmake --install $srcdir/build-qt5
    install -Dm644 ${srcdir}/${pkgbase}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_plastikstyle-qt6(){

	depends=( qt6-base )
	DESTDIR="$pkgdir" cmake --install $srcdir/build-qt6
    install -Dm644 ${srcdir}/${pkgbase}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
