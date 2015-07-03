# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=knyttunderground
pkgver=1.2.1
pkgrel=1
pkgdesc="A 2D platform game featuring a quirky story and a huge world to explore"
url="http://www.knyttunderground.com"
arch=('x86_64' 'i686')
license=('custom:commercial')
depends=('freetype2' 'libogg' 'openal' 'libpng12' 'python2' 'libvorbis')

DLAGENTS+=('file::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\","; exit 1')
if [ "${CARCH}"="x86_64" ]; then
	source=("file://Ripstone-2c4f2-KnyttUnderground1.2.164bit.tar.gz")
	sha512sums=('33a5e1b73a0cc2382378c902b60ff34a73b5609acde7a0f9e301ae64f87de628689fca22feb78c6323dd86f20768a50e2a5aed7de852caa816d62a06f71a3a9d')
else
	source=("file://Ripstone-2c4f2-KnyttUnderground1.2.132bit.tar.gz")
	sha512sums=('364aeab0f091ae8be68bdae4acfe86416e3ed0c4409aa18bef057e60933057f24a2b75dcea5dbbc7ae2e1f53e59663063b6b944438f64a488c88162e669826a2')
fi
source+=("${pkgname}.png")
sha512sums+=('e026fc0d9f3cbbea8f089c48f914f479f791655d996205d6b71e0a6fe2d0511fcc62ade276f912f7576342e7e537993e0ac5da0afe85c9efb78f42dc571a8ae7')

PKGEXT=".pkg.tar"

package() {
	install -Dm 755 "${srcdir}/Knytt Underground/bin/Knytt Underground" "${pkgdir}/opt/${pkgname}/bin/${pkgname}"
	install -Dm 755 "${srcdir}/Knytt Underground/lib/libglfw.so.2" "${pkgdir}/opt/${pkgname}/lib/libglfw.so.2"
	mv "${srcdir}/Knytt Underground/Data" "${pkgdir}/opt/${pkgname}/"
	mv "${srcdir}/Knytt Underground/World" "${pkgdir}/opt/${pkgname}/"
	mv "${srcdir}/Knytt Underground/alsoft.conf" "${pkgdir}/opt/${pkgname}/"
	mv "${srcdir}/Knytt Underground/Game.ini" "${pkgdir}/opt/${pkgname}/"
	install -Dm 644 "${srcdir}/${source[1]}" "${pkgdir}/usr/share/pixmaps/${source[1]}"
	echo "#!/bin/sh
cd /opt/${pkgname}
./bin/${pkgname}" > "${srcdir}/${pkgname}"
	install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	echo "[Desktop Entry]
Type=Application
Name=Knytt Underground
GenericName=Knytt Underground
Comment=${pkgdesc}
Icon=${pkgname}
Exec=/usr/bin/${pkgname}
Path=/opt/${pkgname}
Categories=Game;" > "${srcdir}/${pkgname}.desktop"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
