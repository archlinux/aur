# Maintainer: taotieren <admin@taotieren.com>

pkgname=notepad---git
pkgver=1.21.r14.g2c8c1d9
pkgrel=1
pkgdesc="Notepad-- 是一个简单的国产跨平台文本编辑器，是替换 Notepad++ 的一种选择。其内置强大的代码对比功能，让你丢掉付费的 Beyond Compare。"
arch=('any')
url="https://gitee.com/cxasm/notepad--"
license=('GPL')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(qt5-base
        qt5-xmlpatterns)
makedepends=(git
            qt5-tools )
backup=()
options=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/src/qscint/src/"
    qmake-qt5 -makefile -o Makefile "CONFIG+=release"
    make

    cd "${srcdir}/${pkgname}/src/"
    qmake-qt5 -makefile -o Makefile "CONFIG+=release"
    make
}

package() {
    cp -ra "${srcdir}"/${pkgname}/src/linux/*  "$pkgdir"/
    install -Dm0755 "${srcdir}/${pkgname}/src/x64/Release/Notepad--" "${pkgdir}/usr/bin/${pkgname%-git}"
}
