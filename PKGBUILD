# Maintainer: Janis Hutz <development@janishutz.com>

pkgname=lovr-bin
pkgver=0.19.0
pkgrel=1
pkgdesc='An open source Lua framework for building 3D games and VR experiences.'
arch=('any')
url="https://lovr.org"
license=('GPL3')
depends=()
makedepends=()
provides=('lovr')
conflicts=('lovr' 'lovr-git')
source=('lovr'::https://github.com/bjornbytes/lovr/releases/download/v${pkgver}/lovr-v${pkgver}-x86_64.AppImage)
noextract=('lovr')
sha256sums=('09ce6f13c90f19c9aa3e40c00e1321ec4b27e00ed2f15e5bb336e349629b5c14')

prepare() {
	chmod +x "lovr"
	./lovr --appimage-extract >/dev/null
}

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/lovr"
}
