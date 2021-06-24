# Maintainer: Fansure Grin <quarlong@qq.com>
pkgname=whale
_pkgname=Whale
pkgver=2.4.0
pkgrel=1
pkgdesc="A Unofficial Trello app"
arch=('x86_64')
url="https://github.com/1000ch/whale"
license=('MIT')
depends=('gtk3' 'nss')
makedepends=('tar')
source=("https://github.com/1000ch/whale/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
md5sums=('79f3a1a81b6205b7de98cb27473cb752')

build() {
        tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/
}

package() {
        cd ${srcdir}/
        install -Ddvm755 ${pkgdir}/opt/

        # binary & lib
        cp -a "opt/${_pkgname}"  "${pkgdir}/opt/${_pkgname}"

        # doc 
        install -Dvdm755 "${pkgdir}/usr/share/doc/"
        cp -a "usr/share/doc/${pkgname}"  "${pkgdir}/usr/share/doc"

        # icon
        install -Dvm644 "usr/share/icons/hicolor/0x0/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

        # desktop entry 
        install -Dvm644 "usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
		#sed -i "/Icon=/c\/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	   
		 # Link to the binary
        install -Dvdm755 "${pkgdir}/usr/bin"
        ln -sf "/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
       
		 # SUID chrome-sandbox for Electron 5+
        chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox" || true
}
