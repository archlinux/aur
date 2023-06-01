# Maintainer: littzhch <2371050115@qq.com>

pkgname=notepad---bin
pkgver=2.5.0
pkgrel=1
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
    libglvnd
    glibc
    hicolor-icon-theme
    )
source=("${url}/releases/download/notepad-v${pkgver/%.[0-9]/}/com.hmja.notepad_${pkgver}.0_amd64.deb")
sha256sums=('947bf996df7a0af418853ecc3685f631f5362331f133208e161e683a11a57fe4')

prepare() {
    cd ${srcdir}
    tar -xvf data.tar.xz
}


package() {
    install -Dm755 "${srcdir}/opt/apps/com.hmja.notepad/files/Notepad--" "${pkgdir}/usr/bin/notepad--"

    cd "${srcdir}/opt/apps/com.hmja.notepad/entries"
    sed "s/\/opt\/apps\/com.hmja.notepad\/entries/\/usr\/share/g" -i applications/com.hmja.notepad.desktop
    sed "s/\/opt\/apps\/com.hmja.notepad\/files\/Notepad/\/usr\/bin\/notepad/g" -i applications/com.hmja.notepad.desktop
    sed "s/Categories=TextEditor;/Categories=TextEditor;Development;Utility;/g" -i applications/com.hmja.notepad.desktop
    install -Dm644 applications/com.hmja.notepad.desktop "${pkgdir}/usr/share/applications/com.hmja.notepad.desktop"

    cp -r icons "${pkgdir}/usr/share/"    
}