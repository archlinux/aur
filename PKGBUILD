pkgname=kde-fcstd-thumbnailer-git
pkgver=2.0.0
pkgrel=3
pkgdesc='FreeCAD Thumbnail Creator.'
arch=('i686' 'x86_64')
url='https://github.com/StefanHamminga/kde-fcstd-thumbnailer'
license=('GPL3')

depends=('qt6-base' 'kio')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'kservice')

source=("${pkgname}::git+${url}.git" 'KDE6_compatible_fix.patch')
sha256sums=('SKIP' '2e3020e7efd2776f14a0dce21f5ab2c98ae99911d9b934f3f83ffeb78771533d')

prepare() {
    cd ${srcdir}/${pkgname}/
    patch -Np1 -i ${srcdir}/KDE6_compatible_fix.patch
    desktoptojson -i ./src/fcstdthumbnailer.desktop
}

build() {
	cd ${srcdir}/${pkgname}/
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
	cmake --build build
}

package() {
	cd ${srcdir}/${pkgname}/
	DESTDIR=${pkgdir} cmake --install build --config Release
}
