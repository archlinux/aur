# Maintainer: Nikos Fytilis <n-fit@hotmail.com>
# Contributor: Pavel Lymarev <x-user at bk dot ru>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Rene Schoebel (wesley) <schoebel.r at gmail dot com>

pkgname=openjk-bin
_pkgver='2018-02-26-e3f22070'
pkgver=$(echo $_pkgver | tr - .)
pkgrel=1
pkgdesc="Open Source Jedi Knight II + III Engine - pre built"
arch=('x86_64')
url="https://github.com/JACoders/OpenJK"
license=('GPL')
depends=('libgl' 'openal' 'zlib' 'sdl2' 'libjpeg' 'glu')
makedepends=()
optdepends=('libpng')
provides=(openjk)
conflicts=(openjk-git)
source=("https://builds.openjk.org/openjk-$_pkgver-linux-64.tar.gz"
	'openjkmp.png'
	'openjksp.png'
	'openjkmp.desktop'
	'openjksp.desktop')
sha256sums=('80b831c821ba5676fb981becc1b655b728d09114c16135211f62ada32480184a'
            '0e82e720777eeb2043c2c25cdbce702c6d4ca077543aedfe51e5c4e96cf03969'
            'afb2c1a757720c70798e7f7218f823297a43bc61e0cb192e9443df67c2963903'
            'd3ad7dd270e57d36a22caef21bff17f2eb4acb0ad9087f6a17ca4a0bf9c566fc'
            'd03554bd926954218c243a1a97d39ea9700d064a2374f671249a533ebd970375')
package() {
	cd "${srcdir}"
	install -d "${pkgdir}"/opt/JediAcademy
	cp -r install/JediAcademy/* "${pkgdir}"/opt/JediAcademy


	mkdir -p "${pkgdir}/usr/bin"
	_jkarch=$arch
	cat > ${pkgdir}/usr/bin/openjk << EOF
#!/bin/bash
cd /opt/JediAcademy
exec ./openjk.${_jkarch} \$@
EOF
	cat > ${pkgdir}/usr/bin/openjk_sp << EOF
#!/bin/bash
cd /opt/JediAcademy
exec ./openjk_sp.${_jkarch} \$@
EOF
	cat > ${pkgdir}/usr/bin/openjkded << EOF
#!/bin/bash
cd /opt/JediAcademy
exec ./openjkded.${_jkarch} \$@
EOF
	chmod +x ${pkgdir}/usr/bin/openjk
	chmod +x ${pkgdir}/usr/bin/openjk_sp
	chmod +x ${pkgdir}/usr/bin/openjkded

	chmod 755 -R ${pkgdir}/opt/JediAcademy

	install -Dm755 "${srcdir}/openjkmp.png" "${pkgdir}/usr/share/pixmaps/openjkmp.png"
	install -Dm755 "${srcdir}/openjksp.png" "${pkgdir}/usr/share/pixmaps/openjksp.png"
	install -Dm755 "${srcdir}/openjkmp.desktop" "${pkgdir}/usr/share/applications/openjkmp.desktop"
	install -Dm755 "${srcdir}/openjksp.desktop" "${pkgdir}/usr/share/applications/openjksp.desktop"
}
