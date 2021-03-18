# Maintainer: Shen ZhongLi <szl921818@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
#mindmaster 中文版

pkgname=mindmaster_cn
_pkgname=MindMaster-8
_softname=mindmaster
pkgver=8.5.2
pkgrel=10
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster" "mindmaster-cn")
replaces=('mindmaster-cn')
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/${_softname}_${pkgver}_cn.${arch}.deb")
sha256sums_x86_64=('2cda609b477d69fec0bdd8a10a21511f9d1c4fc6cfab2c3789e7cd58c6ff5991')
source=("${_softname}.desktop"
        "${_softname}")
sha256sums=('a090cb4f1ad939ddbd44f8cc6d2fc0caa65bccbee4daa7abe2a36b4866fc8856'
            '7bd6592bb4292311bae21fba8af4f4db6b22fe90ab679df9bad3213aa3e17ae5')
            
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
                    "${pkgdir}/usr/share/applications/"
   
    install -Dm755 "${srcdir}/${_softname}" "${pkgdir}/usr/bin/${_softname}"
    install -m755 "${srcdir}/${_softname}.desktop" "${pkgdir}/opt/${_pkgname}/${_softname}.desktop"
    ln -sf "/opt/${_pkgname}/${_softname}.desktop" "${pkgdir}/usr/share/applications/${_softname}.desktop"
    ln -sf "/opt/${_pkgname}/${_softname}.png" "${pkgdir}/usr/share/pixmaps/${_softname}.png"
    ln -sf "/opt/${_pkgname}/emmx.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/emmx.svg"
    ln -sf "/opt/${_pkgname}/${_softname}.xml" "${pkgdir}/usr/share/mime/packages/${_softname}.xml"
}


