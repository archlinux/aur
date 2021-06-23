# Maintainer: Fansure Grin <quarlong@qq.com>
pkgname='keymanager'
pkgver=4.4.19
_pkgname="KeyManager-${pkgver}"
pkgrel=1
epoch=
pkgdesc="Provide safe and convenient certificate application and management"
arch=('x86_64')
url="https://keymanager.org/"
license=('unknown')
groups=()
depends=('hicolor-icon-theme')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://keymanager.trustasia.com/release/${_pkgname}.AppImage")
sha256sums=('a7f1d262762024412819ea7ed9be7a73bf129b80c1ef3a66c9ae12cf72ddb012')
noextract=("${_pakname}.AppImage")
md5sums=()
validpgpkeys=()

prepare() {
	cd "${srcdir}" 	
	chmod a+x "${_pkgname}.AppImage"
	${srcdir}/${_pkgname}.AppImage --appimage-extract
	find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
	sed -i "/^Exec=/c\Exec=/opt/${pkgname}/${_pkgname}.AppImage" "squashfs-root/${pkgname}.desktop"
}

package() {
	install -dvm 755 "${pkgdir}/usr/share/icons"
	install -dvm 755 "${pkgdir}/usr/bin"
	install -Dvm 755 "${_pkgname}.AppImage" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
	ln -sf "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
	install -Dvm 644 "squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
	rm -rf "squashfs-root"
}
