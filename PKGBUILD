# Maintainer: taotieren <admin@taotieren.com>
# edrawmax 中文版

pkgname=edrawmax-cn
_pkgname=EdrawMax-11
pkgver=11.1.2
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("edrawmax")
pkgdesc="强大的办公绘图、工程绘图、图文编辑、彩页设计软件"
license=('Commercial')
url="https://www.edrawsoft.cn/edrawmax/"
source_x86_64=("https://www.edrawsoft.cn/2download/${arch}/edrawmax_${pkgver}_cn_${arch}.deb")
sha256sums_x86_64=('ef22f795d5088e17136100b34ba8c6ba6cd179834f53fc74002e7cd68f9dc944')

prepare() {
    ar -x *.deb
	mkdir -p ${pkgname}
    tar -xf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgname}"
}
package() {
    export LC_CTYPE="zh_CN.UTF-8"

    mv  ${srcdir}/${pkgname}/* ${pkgdir}

    install -dm755 "${pkgdir}/usr/bin/" \
                    "${pkgdir}/usr/share/icons/" \
                    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/" \
                    "${pkgdir}/usr/share/mime/packages/"

    ln -sf "/opt/${_pkgname}/edrawmax.desktop" "${pkgdir}/usr/share/applications/edrawmax.desktop"
    ln -sf "/opt/${_pkgname}/EdrawMax" "${pkgdir}/usr/bin/edrawmax"
    ln -sf "/opt/${_pkgname}/edrawmax.png" "${pkgdir}/usr/share/icons/edrawmax.png"
    ln -sf "/opt/${_pkgname}/eddx.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/eddx.svg"
    ln -sf "/opt/${_pkgname}/edrawmax.xml" "${pkgdir}/usr/share/mime/packages/edrawmax.xml"

}
