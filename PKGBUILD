# Contributor: Lars Boettcher <lars@newyew.de>
# Maintainer: Aaron Ali <t0nedef@causal.ca>

pkgname=klayout
pkgver=0.24.9
pkgrel=3
pkgdesc="High Performance Layout Viewer And Editor. Support of GDS and OASIS files."
arch=('i686' 'x86_64')
url="http://www.klayout.org/"
license=('GPL')
depends=('qt4' 'ruby')
source=(
	http://www.klayout.org/downloads/source/klayout-${pkgver}.tar.gz
	klayoutEditor.desktop
	klayoutViewer.desktop
)
build() {
	cd "$srcdir/klayout-${pkgver}"
	build_opt="-qt /usr -qtinc /usr/include/qt4 -qtbin /usr/lib/qt4/bin -bin $pkgdir/usr/bin
		-rblib /usr/lib/libruby.so -rbinc /usr/include/ruby-2.4.0/"
	case ${CARCH} in
		i686)
			sh build.sh $build_opt -platform linux-32-gcc-release
			;;
		x86_64)
			sh build.sh $build_opt -platform linux-64-gcc-release
			;;
	esac
}
package() {
	cd "$srcdir"
	install -D -m 644 klayout-${pkgver}/src/images/logo.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/klayout.png
	install -D -m 755 klayout-${pkgver}/klayout ${pkgdir}/usr/bin/klayout
	install -D -m 644 klayoutEditor.desktop ${pkgdir}/usr/share/applications/klayoutEditor.desktop
	install -D -m 644 klayoutViewer.desktop ${pkgdir}/usr/share/applications/klayoutViewer.desktop
}
#
md5sums=('00c31e05030ac650544473b93d905a14'
         '6f4fffcd97759c57c4c7378634f7bfeb'
         '524300704fa165cca800c82a9d6351b0')
