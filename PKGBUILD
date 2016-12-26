# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt5-color-widgets
_pkgname=QtColorWidgets
pkgver=0.r194.5b24c61
pkgrel=1
pkgdesc='A user-friendly color dialog and several color-related widgets for Qt'
arch=('i686' 'x86_64')
url='https://github.com/mbasaglia/Qt-Color-Widgets'
license=('LGPL3')
depends=('qt5-base')
makedepends=('git')
provides=('qt-color-widgets-common')
conflicts=('qt-color-widgets-common')
replaces=('qt5-color-picker')
source=("${pkgname}::git+git://github.com/mbasaglia/Qt-Color-Widgets.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	eval "qmake-${pkgname::3} PREFIX=${pkgdir}/usr"
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install_target
	install -d "${pkgdir}/usr/include/${_pkgname}"
	find 'src' -type f -iname '*.hpp' -exec install -Dvm644 {} "${pkgdir}/usr/include/${_pkgname}/" \;
	find 'include' -maxdepth 1 -type f -exec install -Dvm644 {} "${pkgdir}/usr/include/${_pkgname}/" \;
}
