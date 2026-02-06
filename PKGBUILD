# Maintainer: Thomas Rogdakis <thomas(at)rogdakis(dot)com>
# Maintainer: Amirhossein Banavi <ahbanavi at gmail dot com>

pkgname=tinkerwell
pkgver=5.10.0
pkgrel=1
pkgdesc="The code runner for PHP"
_appimage_name="Tinkerwell-${pkgver}.AppImage"

url="https://tinkerwell.app"
arch=("x86_64")
license=("custom")
source=("https://download.tinkerwell.app/tinkerwell/${_appimage_name}")
sha256sums=("deface95d8174030ca87e95d6b0421401b10b97edcb066a8df25fae294aa9b05")

prepare() {
	chmod +x ${_appimage_name}
	./${_appimage_name} --appimage-extract
}

package() {
	install -d ${pkgdir}/usr/lib/${pkgname}
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/share/icons/hicolor/512x512/apps

	cp -r ${srcdir}/squashfs-root/* ${pkgdir}/usr/lib/${pkgname}
	ln -s /usr/lib/${pkgname}/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
	
	sed -i "s/AppRun/${pkgname}/" ${pkgdir}/usr/lib/${pkgname}/${pkgname}.desktop
	ln -s /usr/lib/${pkgname}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

	ln -s /usr/lib/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

	find ${pkgdir}/usr/lib/${pkgname} -type d -exec chmod 755 {} \;
}
