# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: https://github.com/demmm

_pkgname=qtcurve
pkgname=qtcurve-gtk
pkgver=1.8.18.6
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='The QtCurve style engine for GTK. Customized for Plasma 5.'
url='https://projects.kde.org/projects/playground/base/qtcurve'
depends=('qtcurve' 'gtk2')
provides=('qtcurve-gtk2')
conflicts=('qtcurve-gtk2')
makedepends=('extra-cmake-modules' 'git')
source=("git://anongit.kde.org/qtcurve.git" 'kdeglobals' 'icons3' 'icons4')
sha256sums=('SKIP'
            '9a7cbad3099f4409503afb2ae9e02341f4ecf54b86f7386961c79ed3839d9751'
            'f401da650d2bd5cb7ff0a0b3c0b6e575b6dbad298fa8f013a1be912e5a458b83'
            '676e3f8e1b7578f6a7eb2267af6149cc0bb0a4fb75b191ff334673ab3d0335d9')

build() {
	cd ${srcdir}/${_pkgname}
	
	mkdir build
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
	
	rm -r ${pkgdir}/usr/lib/libqtcurve-utils.so*
	rm -r ${pkgdir}/usr/share/themes/QtCurve/gtk-2.0/kdeglobals
	rm -r ${pkgdir}/usr/share/themes/QtCurve/gtk-2.0/icons3
	rm -r ${pkgdir}/usr/share/themes/QtCurve/gtk-2.0/icons4
	install -D -m644 ${srcdir}/kdeglobals ${pkgdir}/usr/share/themes/QtCurve/gtk-2.0/
	install -D -m644 ${srcdir}/icons3 ${pkgdir}/usr/share/themes/QtCurve/gtk-2.0/
	install -D -m644 ${srcdir}/icons4 ${pkgdir}/usr/share/themes/QtCurve/gtk-2.0/
}
