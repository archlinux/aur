# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=gitbook-editor
pkgver=4.2.0
pkgrel=1
pkgdesc="Gitbook Editor - Write and publish books"
arch=('i686' 'x86_64')
url="https://www.gitbook.com/editor"
license=('custom')

source_x86_64=("gitbook-editor-${pkgver}-linux-x64.deb::http://downloads.editor.gitbook.com/download/linux-64-bit")
source_i686=("gitbook-editor-${pkgver}-linux-ia32.deb::http://downloads.editor.gitbook.com/download/linux-32-bit")

sha256sums_x86_64=('fa47aa91a172101cb28f136e877ce4f022f1c5a5e209c9b31aa52f176b80329c')
sha256sums_i686=('1cd35e101f065c7b88c5c04dcd86d257f8cd5af698bdad3f95047d048993bafe')

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
