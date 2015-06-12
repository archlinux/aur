# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=costume-quest-hib
pkgver=2013_06_04
pkgrel=1
pkgdesc="A halloween themed 3D action adventure (Humble Bundle)"
arch=('i686' 'x86_64')
url="http://www.doublefine.com/"
license=('custom:commercial')

#[ $CARCH == "x86_64" ] && depends=('lib32-libgl' 'lib32-glu' 'lib32-zlib' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext' 'lib32-libxcb' 'lib32-libxau' 'lib32-libxdmcp') optdepends=('lib32-libtxc_dxtn: texture decoding for open source ATI and Intel drivers' 'lib32-libpulse: needed for sound on systems using pulse') || depends=('libgl' 'glu' 'zlib' 'glibc' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp') optdepends=('libtxc_dxtn: texture decoding for open source ATI and Intel drivers' 'libpulse: needed for sound on systems using pulse')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
PKGEXT='.pkg.tar'

_gamepkg="CostumeQuest-Linux-${pkgver//_/-}-setup.bin"

source=("hib://$_gamepkg"
	"costume-quest.desktop")

sha512sums=('f0c2252002570981958a1aca54e2d86ddab00e8d4135f0baade780cdcd165befbe072c9e55ff90e655ad6667aa5f1e5959026b09b269bbed795ab934009581c2'
	'4da27b4d4d672637f5dcd51d2aebc15f6e1ded6690cf7e91a17c565d2e570fca6ade90bb984a9db83ea2e08bbe463e5b197c077324dec72d6716bbfbee14e2f3')

package() {
	mkdir -p "${pkgdir}"/{opt,usr/{bin,share/applications}}
	mv "${srcdir}"/data "${pkgdir}"/opt/costume-quest
	echo '#!/bin/bash
cd /opt/costume-quest
./Cq.bin.x86' > "${pkgdir}"/usr/bin/costume-quest
	chmod a+x "${pkgdir}"/usr/bin/costume-quest
	mv ${source[1]} "${pkgdir}"/usr/share/applications/
}
