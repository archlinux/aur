# Maintainer: Shen ZhongLi <szl921818@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# mindmaster 中文版

pkgname=mindmaster_cn
_pkgname=MindMaster-10
_softname=mindmaster
pkgver=10.0.3
pkgrel=3
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster" "mindmaster-cn" "mindmaster_en")
replaces=('mindmaster-cn')
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/${_softname}_${pkgver}_cn.${arch}.deb")
sha256sums_x86_64=('ff5fb31a0dea8dc65e29cceedccfa31524c53031fe5d142e0d9fef5c847249dc')
noextract=("${_softname}_${pkgver}_cn.${arch}.deb")

prepare() {
#    ar -x *.rpm
	mkdir -p ${pkgname}
    bsdtar -xf "${srcdir}/${_softname}_${pkgver}_cn.${arch}.deb" --numeric-owner -C "${srcdir}/${pkgname}"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    bsdtar -xf "${srcdir}/${pkgname}/data.tar.xz" --numeric-owner -C "${pkgdir}"

    sed -i 's|"$@"|"$@" --no-sandbox|g' "${pkgdir}/opt/${_pkgname}/${_softname}.sh"

    install -dm0755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/${_pkgname}/${_softname}.sh" "${pkgdir}/usr/bin/${_softname}"
}
