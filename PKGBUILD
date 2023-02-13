# Maintainer: littzhch <2371050115@qq.com>

pkgname=notepad---bin
pkgver=1.22.1
pkgrel=2
pkgdesc="Notepad-- 是一个简单的国产跨平台文本编辑器，是替换 Notepad++ 的一种选择。其内置强大的代码对比功能，让你丢掉付费的 Beyond Compare。"
arch=('x86_64')
url="https://github.com/cxasm/notepad--"
license=('GPL3')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
depends=(
    gcc-libs
    qscintilla-qt5
    qt5-xmlpatterns
    qt5-base
    libGL.so=1
    )
source=("${url}/releases/download/Notepad--v${pkgver/%.[0-9]/}/com.hmja.notepad_${pkgver}_amd64.deb")
sha256sums=('0d460747a5c3da0cf5b9fa59f4c36b7a589cdd241c8d4f2ede22d96c19773535')

prepare() {
    cd ${srcdir}
    tar -xvf data.tar.xz
}


package() {
    install -Dm755 "${srcdir}/opt/apps/com.hmja.notepad/files/Notepad--" "${pkgdir}/usr/bin/notepad--"

    cd "${srcdir}/opt/apps/com.hmja.notepad/entries"
    sed "s/\/opt\/apps\/com.hmja.notepad\/entries/\/usr\/share/g" -i applications/com.hmja.notepad.desktop
    sed "s/\/opt\/apps\/com.hmja.notepad\/files\/Notepad/\/usr\/bin\/notepad/g" -i applications/com.hmja.notepad.desktop
    install -Dm644 applications/com.hmja.notepad.desktop "${pkgdir}/usr/share/applications/com.hmja.notepad.desktop"

    cp -r icons "${pkgdir}/usr/share/"    
}