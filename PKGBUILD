# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname="metalslug3"
pkgver="2014_06_09"
pkgrel=2
pkgdesc="Very hard sidescrolling platformer/shooter"
arch=('x86_64' 'i686')
url='http://www.snkplaymore.co.jp/us/games/steam/metalslug3/'
license=('custom:commercial')
depends=('sdl2' 'sdl2_mixer')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://MetalSlug3-Linux-${pkgver//_/-}.sh")
sha512sums=("af2a94bf49cf9ad515d98c08ea61248d7f53529f369d7002de567be4d6a0afe465906c4a3d0b8a30b968db76e22a90c585671e7105aee4205a2597239d111ccc")

package() {
	mkdir -p ${pkgdir}/{opt,usr/{bin,share/applications}}
	mv ${srcdir}/data/noarch ${pkgdir}/opt/${pkgname}
	if [ "$CARCH" = "x86_64" ]; then
		install -m 755 ${srcdir}/data/x86_64/MetalSlug3.bin.x86_64 ${pkgdir}/opt/${pkgname}/MetalSlug3.bin
	else
		install -m 755 ${srcdir}/data/x86/MetalSlug3.bin.x86 ${pkgdir}/opt/${pkgname}/MetalSlug3.bin
	fi

	ln -s /opt/${pkgname}/MetalSlug3.bin ${pkgdir}/usr/bin/${pkgname}
	echo "[Desktop Entry]
Encoding=UTF-8
Value=1.0
Type=Application
Name=Metal Slug 3
GenericName=Metal Slug 3
Comment=${pkgdesc}
Icon=/opt/${pkgname}/icon.png
Exec="/opt/${pkgname}/MetalSlug3.bin"
Categories=Game;
Path=/opt/${pkgname}" > ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
