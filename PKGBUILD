# Maintainer: Gustavo H. Montesião de Sousa <gustavo aat claroenigma dot com dot br>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Earnestly
pkgname=antimony-git
pkgver=0.9.3b.r12.2618d096
pkgrel=1
pkgdesc="Graph-based 3D CSG CAD modeller"
arch=(x86_64)
url="http://www.mattkeeter.com/projects/antimony/3/"
license=('MIT')
depends=('qt5-base' 'python' 'boost-libs')
makedepends=('git' 'ninja' 'lemon' 'flex' 'boost')
provides=(${pkgname})
source=("${pkgname}::git://github.com/mkeeter/antimony.git" "antimony.desktop")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}"
	cmake \
		-GNinja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	ninja
}

package() {
	cd "$srcdir/${pkgname}"
	DESTDIR=${pkgdir} ninja install

	mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable
	cp deploy/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/antimony.svg

	mkdir -p ${pkgdir}/usr/share/applications
	cp ../antimony.desktop ${pkgdir}/usr/share/applications/antinomy.desktop
}
