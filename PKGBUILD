# Maintainer: Martin Fritz <Fritz.Martin99@web.de>
pkgbase=plastikstyle
_pkgbase_camel=PlastikStyle
pkgname=(plastikstyle-qt5 plastikstyle-qt6)
pkgver=1.0.4
pkgrel=4
license=(LGPL-2.1-or-later)
pkgdesc="QStyle for qt5 and qt6 providing the look of KDE3's plastik"
arch=(x86_64)
url=https://github.com/MartinF99/PlastikStyle
source=('https://github.com/MartinF99/PlastikStyle/archive/refs/tags/1.0.4.tar.gz')
sha256sums=('dc5a37645f1242d07275ae513ef4d134c5f2e3c15a8b549e8038789f6396f28f')
makedepends=(qt5-tools
	     qt6-tools
             cmake)
conflicts=(PlastikStyle PlastikStyle-debug plastikstyle plastikstyle-debug)

build(){
	mkdir build-qt6
	cmake -B build-qt6 -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_ALL=OFF -DENABLE_QT6=ON $srcdir/${_pkgbase_camel}-$pkgver
	cmake --build build-qt6

	mkdir build-qt5
	cmake -B build-qt5 -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_ALL=OFF -DENABLE_QT5=ON $srcdir/${_pkgbase_camel}-$pkgver
	cmake --build build-qt5
}
package_plastikstyle-qt5(){
	depends=( qt5-base )
	DESTDIR="$pkgdir" cmake --install $srcdir/build-qt5
    install -Dm644 ${srcdir}/${_pkgbase_camel}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_plastikstyle-qt6(){

	depends=( qt6-base )
	DESTDIR="$pkgdir" cmake --install $srcdir/build-qt6
    install -Dm644 ${srcdir}/${_pkgbase_camel}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
