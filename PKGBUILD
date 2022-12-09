# Maintainer: wangzhichao <wangzhichao1990@126.com>
pkgname=redpanda-cpp-git
pkgver=2.5
pkgrel=2
pkgdesc="A lightweighted QT-based C/C++ IDE"
arch=('x86_64')
url="https://github.com/royqh1979/RedPanda-CPP"
license=('GPL3')
makedepends=(git make qt5-base)
optdepends=('git: for git support')
source=("git+https://github.com/royqh1979/RedPanda-CPP.git" "redpandaide.desktop")
sha256sums=('SKIP' '8b5b7a27e7ea3ac31bdab6451a40124398a6c6625e64cf9cb6c2664b6939527a' )

build() {
    cd RedPanda-CPP/
    qmake Red_Panda_CPP.pro 
    make -j8
}

package() {
    mkdir -p ${pkgdir}/opt/RedPandaIDE
    cp -r ${srcdir}/RedPanda-CPP/RedPandaIDE/RedPandaIDE ${pkgdir}/opt/RedPandaIDE
    mkdir -p ${pkgdir}/usr/local/libexec/RedPandaCPP
    cp -r ${srcdir}/RedPanda-CPP/tools/astyle/astyle ${pkgdir}/usr/local/libexec/RedPandaCPP
    cp -r ${srcdir}/RedPanda-CPP/tools/consolepauser/consolepauser ${pkgdir}/usr/local/libexec/RedPandaCPP
    cp -r ${srcdir}/RedPanda-CPP/tools/redpanda-git-askpass/redpanda-git-askpass ${pkgdir}/usr/local/libexec/RedPandaCPP
    cp -r ${srcdir}/RedPanda-CPP/RedPandaIDE/images ${pkgdir}/opt/RedPandaIDE
    install -Dm644 ${srcdir}/redpandaide.desktop ${pkgdir}/usr/share/applications/redpandaide.desktop
}
