# Maintainer: taotieren <admin@taotieren.com>

pkgname=mindmaster_en
_softname=mindmaster
_pkgname=MindMaster-8
pkgver=8.5.2
pkgrel=2
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster_cn")
replaces=("mindmaster")
pkgdesc="Multi-functional, good-looking, easy-to-use professional mind mapping software"
license=('Commercial')
url="https://www.edrawsoft.com/download-mindmaster.html"
source_x86_64=("https://download.edrawsoft.com/archives/${_softname}_${pkgver}_en.${arch}.deb")
sha256sums_x86_64=('8ad99d719174281852e258b6c9a720de1638e55eca5fd4729970dcbbc9a9cdbd')
source=("${_softname}.desktop")
sha256sums=('a090cb4f1ad939ddbd44f8cc6d2fc0caa65bccbee4daa7abe2a36b4866fc8856')
            
prepare() {
    ar -x *.deb
	mkdir -p ${pkgname}
    tar -xf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgname}"
}

package() {	
    export LC_CTYPE="zh_CN.UTF-8"
    mv  ${srcdir}/${pkgname}/* ${pkgdir}
    
    install -dm755  "${pkgdir}/usr/share/pixmaps/" \
                    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/" \
                    "${pkgdir}/usr/share/mime/packages/" \
                    "${pkgdir}/usr/share/applications/" \
                    "${pkgdir}/usr/bin/"
   
    install -m755 "${srcdir}/${_softname}.desktop" "${pkgdir}/opt/${_pkgname}/${_softname}.desktop"
    ln -sf "/opt/${_pkgname}/${_softname}.desktop" "${pkgdir}/usr/share/applications/${_softname}.desktop"
    ln -sf "/opt/${_pkgname}/MindMaster" "${pkgdir}/usr/bin/${_softname}"
    ln -sf "/opt/${_pkgname}/${_softname}.png" "${pkgdir}/usr/share/pixmaps/${_softname}.png"
    ln -sf "/opt/${_pkgname}/emmx.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/emmx.svg"
    ln -sf "/opt/${_pkgname}/${_softname}.xml" "${pkgdir}/usr/share/mime/packages/${_softname}.xml"
}
