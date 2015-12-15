# Maintainer: ssf <punx69 at gmx dot net>

pkgbase='qt5-style-plugins-git'
pkgname=('qt5-style-plastique' 'qt5-style-motif' 'qt5-style-cleanlooks' 'qt5-style-gtk2')
pkgver=5.0.0.r20
pkgrel=1
pkgdesc="Qt5 extra widget styles"
arch=('i686' 'x86_64')
url="http://code.qt.io/cgit/qt/qtstyleplugins.git"
license=("LGPL2.1" "LGPL3")
groups=('qt5-style-plugins')
makedepends=('qt5-base' 'gtk2' 'gconf' 'sed')
source=("${pkgbase//-git/}::git://code.qt.io/qt/qtstyleplugins.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase//-git/}"
	_ver=$(git describe --abbrev=0 --tags|sed 's/^v//')
	_rev=$(git rev-list --count HEAD)
	printf "$_ver.r$_rev"
}

prepare() {
	cd "${pkgbase//-git/}"
#rm the blackberry10 style since there is no qpixmapstyle
	sed -i '/bb10style/d;/plastique /c\    plastique'  src/plugins/styles/styles.pro
}

build() {
	cd "${pkgbase//-git/}"
	/usr/lib/qt/bin/qmake
	make
}

package_qt5-style-plastique() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='Plastique style ported to Qt5'
	depends=('qt5-base')
	install -Dm0644 "${pkgbase//-git/}"/plugins/styles/libqplastiquestyle.so "${pkgdir}"/usr/lib/qt/plugins/styles/libqplastiquestyle.so
}

package_qt5-style-motif() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='Motif style ported to Qt5'
	depends=('qt5-base')
	install -Dm0644 "${pkgbase//-git/}"/plugins/styles/libqmotifstyle.so "${pkgdir}"/usr/lib/qt/plugins/styles/libqmotifstyle.so
}

package_qt5-style-cleanlooks() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='cleanlooks style ported to Qt5'
	depends=('qt5-base')
	install -Dm0644 "${pkgbase//-git/}"/plugins/styles/libqcleanlooksstyle.so "${pkgdir}"/usr/lib/qt/plugins/styles/libqcleanlooksstyle.so
}

package_qt5-style-gtk2() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='GTK2 style ported to Qt5'
	depends=('qt5-base' 'gconf' 'gtk2')
	install -Dm0644 "${pkgbase//-git/}"/plugins/styles/libqgtk2style.so "${pkgdir}"/usr/lib/qt/plugins/styles/libqgtk2style.so
}
