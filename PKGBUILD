pkgbase=navicat-premium-lite
pkgname=("${pkgbase}-en" "${pkgbase}-zh-cn")
pkgver=17.3.5
pkgrel=2
pkgdesc="Navicat Premium Lite"
arch=('x86_64' 'aarch64')
url="https://www.navicat.com/products/navicat-premium-lite"
license=('proprietary')
source_x86_64=(
	"${pkgbase}-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-en-x86_64.AppImage"
	"${pkgbase}-cs-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-cs-x86_64.AppImage"
)
source_aarch64=(
	"${pkgbase}-en-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-en-aarch64.AppImage"
	"${pkgbase}-cs-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-lite-cs-aarch64.AppImage"
)
sha256sums_x86_64=('48608ae878b3b6fdd9c56a8aa6ea92cb3942bb439f6b1438d3c2084b97ef9777'
                   'ed2ae37b18e46baebbb0c9ae13fc871db1fa6109861e7146e53f84ec7b4f089f')
sha256sums_aarch64=('11e180ba66ef9e177312ebd861b458989990bcb579b0b27686c32e71701292c9'
                    '1e4000cc063101cafbc9902509cb163d2f7cceabd1b9840ba18d7f9e02cd51cf')

package_navicat-premium-lite-en() {
	pkgdesc='Navicat Premium Lite is a compact version of Navicat'
	provides=("${pkgbase}")

	_lang=en
	_app="${pkgbase}-${_lang}-${CARCH}-${pkgver}.AppImage"

	cd "$srcdir/" && rm -rf "squashfs-root"
	chmod +x "${_app}" && ./"${_app}" --appimage-extract

	_pkgroot="opt/${pkgbase}"
	_pkgroot_path="${pkgdir}/${_pkgroot}"
	install -d "${_pkgroot_path}" && cp -a "${srcdir}/squashfs-root/." "${_pkgroot_path}"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop" "${pkgdir}/usr/share/applications/navicat.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"
	install -dm755 "${pkgdir}/usr/bin" && ln -s "/${_pkgroot}/AppRun" "${pkgdir}/usr/bin/navicat"
}
package_navicat-premium-lite-zh-cn() {
	pkgdesc="Navicat Premium Lite 是 Navicat 的精简版"
	provides=("${pkgbase}" "${pkgbase}-cs")

	_lang=cs
	_app="${pkgbase}-${_lang}-${CARCH}-${pkgver}.AppImage"

	cd "$srcdir/" && rm -rf "squashfs-root"
	chmod +x "${_app}" && ./"${_app}" --appimage-extract

	_pkgroot="opt/${pkgbase}"
	_pkgroot_path="${pkgdir}/${_pkgroot}"
	install -d "${_pkgroot_path}" && cp -a "${srcdir}/squashfs-root/." "${_pkgroot_path}"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop" "${pkgdir}/usr/share/applications/navicat.desktop"
	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"
	install -dm755 "${pkgdir}/usr/bin" && ln -s "/${_pkgroot}/AppRun" "${pkgdir}/usr/bin/navicat"
}
