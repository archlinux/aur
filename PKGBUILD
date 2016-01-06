# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=gitbook-editor
pkgver=4.2.3
pkgrel=1
pkgdesc="Gitbook Editor - Write and publish books"
arch=('i686' 'x86_64')
url="https://www.gitbook.com/editor"
license=('custom')

source_x86_64=("gitbook-editor-${pkgver}-linux-x64.deb::http://downloads.editor.gitbook.com/download/linux-64-bit")
source_i686=("gitbook-editor-${pkgver}-linux-ia32.deb::http://downloads.editor.gitbook.com/download/linux-32-bit")

sha256sums_x86_64=('baf5a640feb5f92e246952c2323673407e8fb50c3911eef8868df36e9eb641b0')
sha256sums_i686=('57071bcbcdb00a2cc3751dee42f9bfd1d9aa993c5a2dc80b6c03e7741eb191a7')

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
