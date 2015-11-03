# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=gitbook-editor
pkgver=4.1.5
pkgrel=1
pkgdesc="Gitbook Editor - Write and publish books"
arch=('i686' 'x86_64')
url="https://www.gitbook.com/editor"
license=('custom')

source_x86_64=("gitbook-editor-${pkgver}-linux-x64.deb::http://downloads.editor.gitbook.com/download/linux-64-bit")
source_i686=("gitbook-editor-${pkgver}-linux-ia32.deb::http://downloads.editor.gitbook.com/download/linux-32-bit")

sha256sums_x86_64=('55ae09b4b891ac2f3cd28feac2eb7bf02fe5b1d78ca5d4079b3b00dd82881a44')
sha256sums_i686=('dfdf00cdbfe08ae71c0bb315ec9eaae8ed93290686d7f7745465014e1757f742')

prepare() {
    bsdtar -xJf data.tar.xz
}

package() {
    # Copy files
    cp -r {opt,usr} "${pkgdir}"

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/opt/gitbook-editor/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
