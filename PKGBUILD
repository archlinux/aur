# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=gitbook-editor
pkgver=4.2.2
pkgrel=1
pkgdesc="Gitbook Editor - Write and publish books"
arch=('i686' 'x86_64')
url="https://www.gitbook.com/editor"
license=('custom')

source_x86_64=("gitbook-editor-${pkgver}-linux-x64.deb::http://downloads.editor.gitbook.com/download/linux-64-bit")
source_i686=("gitbook-editor-${pkgver}-linux-ia32.deb::http://downloads.editor.gitbook.com/download/linux-32-bit")

sha256sums_x86_64=('a009aa0e177b5e85610d5b02af6e02a01c2e50c01fdd119bc05b9c6564e1191f')
sha256sums_i686=('af64b434db9f9951375e9280b863a60551ef71ac62cb646c41a4ccf3d031c443')

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
