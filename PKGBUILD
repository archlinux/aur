# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: https://github.com/demmm

_pkgname=qtcurve
pkgname=lib32-qtcurve-gtk
pkgver=1.8.18.6
pkgrel=1
arch=('x86_64')
license=('GPL')
pkgdesc='The QtCurve style engine for GTK. Customized for Plasma 5.'
url='https://projects.kde.org/projects/playground/base/qtcurve'
depends=('qtcurve-gtk' 'lib32-gtk2')
provides=('lib32-qtcurve-gtk2')
conflicts=('lib32-qtcurve-gtk2')
makedepends=('extra-cmake-modules' 'git')
source=("git://anongit.kde.org/qtcurve.git")
sha256sums=('SKIP')

build() {
	cd ${srcdir}/${_pkgname}
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release \
		 -DCMAKE_INSTALL_PREFIX=/usr \
		 -DENABLE_GTK2=true \
		 -DQTC_QT5_ENABLE_KDE=false \
		 -DQTC_QT4_ENABLE_KDE=false \
		 -DENABLE_QT5=false \
		 -DENABLE_QT4=false
	make
}

package() {
	cd $srcdir/${_pkgname}/build
	make DESTDIR=${pkgdir} install
	cd ${pkgdir}/usr
	rm -rf lib share
}
