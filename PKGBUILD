# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: duapple <2832893880@qq.com>
pkgname=genmake
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="generate C/C++/Go Makefile template"
arch=(x86_64)
url="https://gitee.com/duapple/genmake/attach_files/904692/download/genmake"
license=('AGPL-3.0')
depends=()
makedepends=("git")
checkdepends=()
optdepends=()
source=("${pkgname}::${url}"
        "genmake_conf.json::https://gitee.com/duapple/genmake/attach_files/904564/download/genmake_conf.json")
noextract=("${source[@]##*/}")
md5sums=("SKIP"
        "SKIP")

prepare() {
    rm -rf ${srcdir}/template
	git clone https://gitee.com/duapple/makefile ${srcdir}/template
    rm -rf ${srcdir}/template/.git
} 

package() {
    mkdir -p ${pkgdir}/usr/bin/
	cp ${srcdir}/${pkgname} ${pkgdir}/usr/bin/
    chmod 777 ${pkgdir}/usr/bin/${pkgname}
    mkdir -p ${pkgdir}/usr/share/${pkgname}/  
    cp -r ${srcdir}/template ${pkgdir}/usr/share/${pkgname}/template
    mkdir -p ${pkgdir}/usr/share/${pkgname}/config
    cp ${srcdir}/genmake_conf.json ${pkgdir}/usr/share/${pkgname}/config/
}
