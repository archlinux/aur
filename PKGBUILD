# Maintainer: ssf <punx69 at gmx dot net>

pkgbase='yefm-git'
pkgname=('yefm')
pkgver=0.2.r20
pkgrel=1
pkgdesc='Simple 2 pane file manager based on Qt, rewritten from qtFM'
arch=('i686' 'x86_64')
url='https://github.com/yede/yefm'
license=('GPL2')
groups=()
install=('pkg.install')
makedepends=('git')
source=("${pkgbase//-git/}::git://github.com/yede/yefm.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase//-git/}"
	_rev=$(git rev-list --count HEAD)
	_ver=$(cat version)
	printf "$_ver.r$_rev"
}

build() {
	cd "${pkgbase//-git/}"
	/usr/lib/qt/bin/qmake
	make
}

package_yefm() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<=${pkgver}")
	pkgdesc='Simple 2 pane file manager based on Qt, rewritten from qtFM'
	depends=('desktop-file-utils' 'qt5-base')
	install -Dm0755 "${pkgbase//-git/}"/bin/yefm "${pkgdir}"/usr/bin/yefm
	install -Dm0644 "${pkgbase//-git/}"/data/yefm.desktop "${pkgdir}"/usr/share/applications/yefm.desktop
	install -d "${pkgdir}"/usr/share/yefm
	mv "${pkgbase//-git/}"/data/translations "${pkgdir}"/usr/share/yefm
}
