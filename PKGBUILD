# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname="symphony"
pkgver=2014.07.15
pkgrel=1
epoch=1405375200
pkgdesc="A musical top down shooter"
arch=('x86_64' 'i686')
url="http://www.symphonygame.com/"
license=('custom:commercial')
makedepends=('unzip')
depends=('sdl2' 'libfmod')
conflicts=('symphony-nomusic')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://Symphony-Linux-${pkgver//./-}.sh")
sha512sums=("c8e193db4fa7d1976f5bf40753320e733ab2b17473b9d3d980edd0533fe88fecaf1d36d35f4ff58aa223409fc86fc2f3f86a1f4137a91d32a3648d86e739b09b")

package() {
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm 755 "${srcdir}/data/x86_64/Symphony.bin.x86_64" "${pkgdir}/opt/${pkgname}/${pkgname}"
		mkdir "${pkgdir}/opt/${pkgname}/lib64"
		ln -s /usr/lib/libfmodex.so "${pkgdir}/opt/${pkgname}/lib64/libfmodex-4.44.20.so"
	else
		install -Dm 755 "${srcdir}/data/x86/Symphony.bin.x86" "${pkgdir}/opt/${pkgname}/${pkgname}"
		mkdir "${pkgdir}/opt/${pkgname}/lib"
		ln -s /usr/lib/libfmodex.so "${pkgdir}/opt/${pkgname}/lib/libfmodex-4.44.20.so"
	fi
	mv "${srcdir}"/data/noarch/* ${pkgdir}/opt/${pkgname}/
	rm "${pkgdir}/opt/${pkgname}/README.linux"
	mkdir -p "${pkgdir}"/usr/{lib,bin,share/applications}
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	echo "[Desktop Entry]
Type=Application
Name=Symphony
GenericName=Symphony
Comment=$pkgdesc
Icon=/opt/${pkgname}/Symphony.png
Exec=/usr/bin/${pkgname}
Categories=Game;
Path=/opt/${pkgname}" > "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
