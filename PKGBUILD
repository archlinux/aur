# Maintainer: Jan Claussen <jan dot claussen10 at web dot de>
pkgname=webos-dev-manager-bin
_pkgname=webos-dev-manager
pkgver=1.9.9
pkgrel=1
pkgdesc="Easy tool to manage developer mode and sideload applications on your webOS TV"
arch=(x86_64)
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache')
depends=("fuse3")
options=(!strip)
provides=("webos-dev-manager")
replaces=("webos-dev-manager" "webos-dev-manager-git")
source_x86_64=("webos-dev-manager.png"
			   "webos-dev-manager.desktop"
			   "${_pkgname}-${pkgver}.AppImage::https://github.com/webosbrew/dev-manager-desktop/releases/download/v${pkgver}/web-os-dev-manager_${pkgver}_amd64.AppImage"
)

noextract=("${_pkgname}-${pkgver}.AppImage")

sha256sums_x86_64=('739240d83b15aa19e5d1b8b2589f50be7de3bec3a9c781e3cf97261fa3de4a22'
				   'ba969ef1cd5a46ce953620bc097c18c9d82432e6c23afef8f67ff620417b80a3'
				   '5fef66f9542ebf94ae9de3e3152a980a9f77d6a005c1f61ecae40946352eadf8')

package() {

	# Install AppImage
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

	# Install icon
	mkdir -p "${pkgdir}/usr/share/pixmaps/"
    install -m 644 "${srcdir}/webos-dev-manager.png" "${pkgdir}/usr/share/pixmaps/"

	# Install desktop file
	echo "install webos-dev-manager.desktop"
	mkdir -p "${pkgdir}/usr/share/applications/"
	install -m 664 "${srcdir}/webos-dev-manager.desktop" "${pkgdir}/usr/share/applications/"
}
