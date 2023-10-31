# Maintainer: duapple <2832893880@qq.com>

pkgname=genmake-bin
basename=genmake
pkgver=0.6.0
pkgrel=1
pkgdesc="Generate C/C++/Go Makefile template"
arch=('x86_64')
url="https://gitee.com/duapple/genmake/raw/master/genmake"
license=('AGPL-3.0')
depends=()
makedepends=("git")
optdepends=()
source=("${srcdir}/makefile::git+https://gitee.com/duapple/makefile.git"
        "${url}"
        "https://gitee.com/duapple/genmake/raw/master/config/genmake_conf.json")
noextract=()
md5sums=("SKIP" "f9e6f628ac405ec063bfe64f27c34c78" "d72e7eca82399f16cfc6efae5a2189f2")

prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}/config
    mv makefile ${pkgname}-${pkgver}/config
    mv genmake_conf.json ${pkgname}-${pkgver}/config
    mv ${basename} ${pkgname}-${pkgver}
}

package() {
    mkdir -p ${pkgdir}/usr/local/${basename}
    mkdir -p ${pkgdir}/usr/bin
    cd ${pkgname}-${pkgver}
    install -Dm777 ${basename} ${pkgdir}/usr/local/${basename}
    mv config ${pkgdir}/usr/local/${basename}
    ln -sf /usr/local/${basename}/${basename} ${pkgdir}/usr/bin/${basename}
}