# Contributor: Dirk Sohler <spam@0x7be.de>               
# Contributor: Hunter Jones <hjones2199 at gmail dot com>
# Maintainer: Thomas Bork <sudobash418 at gmail dot com>
pkgname=worldpainter
pkgver=2.22.0
pkgrel=1
pkgdesc='An interactive map generator for Minecraft'

url='https://www.worldpainter.net/'
arch=('x86_64')
license=('GPL')

depends=('java-environment' 'lib32-libxi' 'sh')
optdepends=('minecraft: for playing the exported maps')

source=("https://www.worldpainter.net/files/${pkgname}_${pkgver}.tar.gz"
		'worldpainter.png'
		'worldpainter.desktop'
		'launch-script.sh')
sha256sums=('2b2a947ab64913440f0a040547ad1ff60fd9d49655136c2d693bac07e4d11ce8'
            'a93cd4af0e8ef470f48a8dd2773fb9d83a5302f1b9bfba67f43b4ec7500a039e'
            '815abfee2eb545a3bac0d2e4e5c0cadc548cc1466c4e0aaf3bfd1f07a15e7741'
            '631cffdb102945a39b28ec33567acd350c3ae5b000face915d24159741942fd0')

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/opt/worldpainter/"{bin,lib,.install4j/user}
	install -dm755 "${pkgdir}/usr/share/"{pixmaps,applications}

	install -Dm644 bin/*        "${pkgdir}/opt/${pkgname}/bin/"
	install -Dm644 lib/*        "${pkgdir}/opt/${pkgname}/lib/"
	install -Dm644 *.vmoptions  "${pkgdir}/opt/${pkgname}/"
	install -Dm755 worldpainter "${pkgdir}/opt/${pkgname}/"
	find .install4j/ -maxdepth 1 -type f -exec install -Dm644 {} "${pkgdir}/opt/${pkgname}/.install4j/" \;
	find .install4j/user/ -maxdepth 1 -type f -exec install -Dm644 {} "${pkgdir}/opt/${pkgname}/.install4j/user/" \;

	install -Dm644 "${srcdir}/worldpainter.png" "${pkgdir}/usr/share/pixmaps/"
	install -Dm755 "${srcdir}/launch-script.sh" "${pkgdir}/usr/bin/worldpainter"
	install -Dm644 "${srcdir}/worldpainter.desktop" "${pkgdir}/usr/share/applications/worldpainter.desktop"
}
