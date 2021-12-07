# Maintainer: duapple <2832893880@qq.com>

pkgname=genmake-bin
basename=genmake
pkgver=0.5.0
pkgrel=1
pkgdesc="generate C/C++/Go Makefile template"
arch=('x86_64')
url="https://gitee.com/duapple/genmake/attach_files/904692/download/genmake"
license=('AGPL-3.0')
depends=()
makedepends=("git")
optdepends=()
source=("${srcdir}/template::git+https://gitee.com/duapple/makefile.git"
        "${url}"
        "https://gitee.com/duapple/genmake/attach_files/904564/download/genmake_conf.json")
noextract=()
md5sums=("SKIP" "cb3845ee35a1bea7b44daa7a9fef3aaf" "2bb569a143fa683893369eba49e8652c")

prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}
    mv template ${pkgname}-${pkgver}
    mv ${basename} ${pkgname}-${pkgver}
    mv genmake_conf.json ${pkgname}-${pkgver}
}

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/${basename}/config
    cd ${pkgname}-${pkgver}
    install -Dm777 ${basename} ${pkgdir}/usr/bin/
    mv template ${pkgdir}/usr/share/${basename}/template
    cp genmake_conf.json ${pkgdir}/usr/share/${basename}/config/
}