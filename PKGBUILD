# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: https://github.com/demmm

pkgname=qtcurve
pkgver=1.8.18.6
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='The QtCurve style engine for Qt5 and Plasma 5.'
url='https://projects.kde.org/projects/playground/base/qtcurve'
depends=('karchive' 'kconfig' 'kconfigwidgets' 'ki18n' 'kdelibs4support' 'kio'
         'kwidgetsaddons' 'kxmlgui' 'libx11' 'qt5-x11extras' 'qt5-svg' 'qt4')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
optdepends=('qtcurve-gtk: The QtCurve style engine for GTK.')
provides=('qtcurve-utils' 'qtcurve-qt4' 'qtcurve-qt5')
conflicts=('qtcurve-utils' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-kde4')
source=("git://anongit.kde.org/qtcurve.git")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}
	
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release \
		 -DCMAKE_INSTALL_PREFIX=/usr \
		 -DENABLE_GTK2=false \
		 -DQTC_QT5_ENABLE_KDE=true \
		 -DQTC_QT4_ENABLE_KDE=false
	make
}

package() {
	cd ${srcdir}/${pkgname}/build
	
	make DESTDIR=${pkgdir} install
}
