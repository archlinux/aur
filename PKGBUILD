# Contributor: Dirk Sohler <spam@0x7be.de>               
# Contributor: Hunter Jones <hjones2199 at gmail dot com>
# Maintainer: Thomas Bork <sudobash418 at gmail dot com>
pkgname=worldpainter
pkgver=2.12.0
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
		'launch-script')
sha256sums=('7427c18d521c20d60bd23c578e726671f23c3516503fc5a7449f8c0c5cdd805b'
            'a93cd4af0e8ef470f48a8dd2773fb9d83a5302f1b9bfba67f43b4ec7500a039e'
            '669f78518b75b441f4382cfd14e207dd91ee1dc967383db1771ec202dbb07cb4'
            'fd64d11450f03c8924cbc133a009b3373bc5f80b2589b63391b65db04d82963f')

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
	install -Dm755 "${srcdir}/launch-script" "${pkgdir}/usr/bin/worldpainter"
	install -Dm644 "${srcdir}/worldpainter.desktop" "${pkgdir}/usr/share/applications/worldpainter.desktop"
}
